from django.http import Http404, HttpResponse
from django.template.loader import get_template
from django.template import Context
from django.core import exceptions

import datetime, os
from hashlib import md5
import itertools, base64, json
import time, random, uuid, redis

from django import shortcuts
from django.shortcuts import render, redirect

from django.contrib.auth import logout
from django.contrib import messages
from django.contrib.sitemaps import Sitemap

from aishack.models import Tutorial, AishackUser, Track, TutorialRead, UserTrack, TrackTutorials, Category, TutorialSeries
from django.contrib.auth.models import User
from aishack import knobs

from haystack.generic_views import SearchView
from haystack.forms import SearchForm

from aishack import utils, settings

############### Global cached variables
featured_tutorials = None
recent_tutorials = None

redis = redis.StrictRedis('localhost')
def index(request):
    """
    The home page
    """
    global featured_tutorials, recent_tutorials
    context = utils.get_global_context(request)
    context.update({'current_page': 'home'})

    if settings.DEBUG:
        featured_tutorials = None
        recent_tutorials = None

    # Fetch the first three featured tutorials
    # Fetch the 3 recent tutorials
    if not featured_tutorials:
        featured_tutorials = list(Tutorial.objects.filter(featured=True).order_by('-date')[0:4])

    if not recent_tutorials:
        recent_tutorials = utils.fetch_tutorials(8)

    categories = None
    if settings.DEBUG:
        categories = list(Category.objects.all().order_by('order'))
    else:
        categories = list(Category.objects.filter(hidden=False).order_by('order'))

    context.update({'featured': featured_tutorials,
                    'recent_tutorials': recent_tutorials,
                    'categories': list(Category.objects.filter(hidden=False).order_by('order'))},
                    )
    return render(request, "index.html", context)

def track_signup(request, slug=None):
    """
    Url to get user to signup for a track
    """
    context = utils.get_global_context(request)
    track = None
    already_signedup = False

    if not slug:
        # Show an error message - need to pass a slug about which track
        # to sign up for
        return redirect('/tutorials/')

    if not request.user.is_authenticated():
        return redirect('/tracks/%s/' % slug)

    # Fetch the track we're trying to sign up for
    track = shortcuts.get_object_or_404(Track, slug=slug)
    list_of_tutorials = track.tutorials.all()

    aishack_user = utils.get_aishack_user(request.user)

    # Confirm if the user hasn't already signed up
    for t in aishack_user.tracks_following.all():
        if t == track:
            # User already signed up
            break
    else:
        # User didn't sign up yet
        ut = UserTrack(user=aishack_user, track=track)
        ut.save()
        already_signedup = True

    return redirect('/tracks/%s/' % slug)

def tracks(request, slug=None):
    """
    The tracks home page
    """
    if not slug:
        # No slug? redirect to all tutorials
        return redirect('/tutorials/')

    context = utils.get_global_context(request)
    context.update({'current_page': 'track',
                    'show_sharing_buttons': settings.SHOW_SHARING_BUTTONS,
                    'show_sharing_buttons_inline': settings.SHOW_SHARING_BUTTONS_INLINE})

    # We do have a slug
    track = shortcuts.get_object_or_404(Track, slug=slug)
    context.update({'track': track})

    list_of_tutorials = track.tutorial_list()
    context.update({'tutorials': list_of_tutorials})

    track_followed = False
    track_completed = False
    tuts_read = []
    if request.user.is_authenticated():
        aishack_user = utils.get_aishack_user(request.user)
        tuts_read = aishack_user.tutorials_read.all()
        list_read = []
        for tut in list_of_tutorials:
            for read in tuts_read:
                if tut.slug == read.slug:
                    list_read.append(True)
                    break
            else:
                list_read.append(False)

        track_followed = track in aishack_user.tracks_following.all()
        tuts_read = aishack_user.tutorials_read.all()

        # TODO insert logic for completed track here
        for tut in track.tutorials.all():
            if tut not in tuts_read:
                track_completed = False
                break
        else:
            track_completed = True
    else:
        list_read = [False] * len(list_of_tutorials)

    context.update({'tutorials_read': tuts_read, 
                    'track_followed': track_followed,
                    'track_completed': track_completed})
    return render(request, 'tracks.html', context)

def tutorials(request, slug=None):
    """
    The tutorials home page
    """
    _num_related = knobs.num_related

    context = utils.get_global_context(request)
    context.update({'current_page': 'tutorials'})

    if slug:
        # This section defines what happens if a tutorial slug is mentioned
        tutorial = shortcuts.get_object_or_404(Tutorial, slug=slug)
        author = utils.get_aishack_user(tutorial.author)

        # Check with track this tutorial belongs to
        tt = TrackTutorials.objects.filter(tutorial=tutorial)
        if tt:
            track = tt[0].track
            track_length = track.tutorial_count()
        else:
            # Just pick the first one
            track = None
            track_length = 0

        page_title = tutorial.title
        if tutorial.series:
            page_title = "%s: %s" % (tutorial.series.name, tutorial.title)

        context.update({'tutorial': tutorial,
                        'track': track,
                        'track_length': track_length,
                        'tuts_in_track_read': 0,
                        'tuts_in_track_read_percent': 0,
                        'page_title': page_title,
                        'author': author.user,
                        'category_slug': tutorial.category.slug,
                        'author_email_md5': md5(author.user.email.encode('utf-8')).hexdigest(),
                        'aishackuser': author,
                        'show_sharing_buttons': settings.SHOW_SHARING_BUTTONS,
                        'show_sharing_buttons_inline': settings.SHOW_SHARING_BUTTONS_INLINE})

        context.update({
            'meta_title': tutorial.title, 
            'meta_description': tutorial.excerpt,
            'meta_thumb': tutorial.post_thumb,
        })

        # Increment the read counter
        tutorial.read_count = tutorial.read_count + 1
        tutorial.save(update_fields=['read_count'])

        # The user isn't logged in - display the pre-processed related tutorials
        related_list = tutorial.related.all()[0:_num_related]

        series_first = None
        if tutorial.series:
            series_first = tutorial.series.tutorials.all()[0]

        context.update({'related_tuts': related_list, 'series_first': series_first})
    else:
        # Fetch all the tracks
        tracks = Track.objects.all()
        context.update({'tracks': tracks})

        # This section defines what happens if the url is just /tutorials/
        # fetch_tutorials discards tutorials that are part of a series and only
        # returns the first part (along with a list of parts in the series)

        output = utils.fetch_tutorials()
        tutorials_to_display = {}

        for tut in output:
            category = Category.objects.get(pk=tut[0]['category'])
            tutorials_to_display.setdefault(category, [])
            tutorials_to_display[category].append(tut)

        context.update({'tutorials_to_display': tutorials_to_display})

        if settings.DEBUG:
            # Debug mode, we show all categories
            categories = list(Category.objects.all().order_by('order'))
        else:
            # Production mode, we show only what's required
            categories = list(Category.objects.filter(hidden=False).order_by('order'))

        context.update({'categories': categories})

    return render(request, "tutorials.html", context)

def contribute(request):
    """
    The tutorials home page
    """
    context = utils.get_global_context(request)
    context.update({'current_page': 'contribute'})
    return render(request, "contribute.html", context)

def about(request):
    """
    The tutorials home page
    """
    context = utils.get_global_context(request)
    context.update({'current_page': 'about'})
    return render(request, "about.html", context)

def login(request):
    context = utils.get_global_context(request)
    return render(request, "login.html", context)

def profile(request, username=None):
    if not username:
        # Try to fetch information about the current user
        if not request.user.is_authenticated():
            return redirect('/')

        user = utils.get_aishack_user(request.user)
    else:
        userobj = shortcuts.get_object_or_404(User, username=username)
        user = utils.get_aishack_user(userobj)

    context = utils.get_global_context(request)

    # Find the list of tutorials read
    tutorials_read = user.tutorials_read_list()

    tracks_following = user.tracks_following.all()
    tracks_completed = []
    for track in tracks_following:
        tuts = track.tutorial_list()

        for tut in tuts:
            if tut not in tutorials_read:
                break
        else:
            tracks_completed.append(track)

    tutorials_written = Tutorial.objects.filter(author=user.user)

    context.update({'aishackuser': user,
                    'tutorials_read_count': len(tutorials_read),
                    'tutorials_read': tutorials_read,
                    'tracks_following': tracks_following,
                    'tracks_following_count': len(tracks_following),
                    'tracks_completed': tracks_completed,
                    'tracks_completed_count': len(tracks_completed),
                    'tutorials_written': tutorials_written,
                    'tutorials_written_count': len(tutorials_written),
                    'current_page': 'profile',
                    'profile_email_md5': md5(user.user.email.encode('utf-8')).hexdigest()})

    return render(request, 'profile.html', context)

def profile_edit(request):
    """
    AJAX requests are sent here
    """

    # Support only get requests
    if request.method != 'POST':
        raise Http404()

    # Confirm if the user is logged in
    if not request.user.is_authenticated():
        raise Http404()

    # Fetch the parameters
    params = request.POST

    # aishackuser
    aishackuser = utils.get_aishack_user(request.user)

    key = params['name']
    value = params['value']
    if key == 'short_bio':
        aishackuser.short_bio = value
        aishackuser.save()
    elif key == 'website':
        aishackuser.website = value
        aishackuser.save()
    elif key == 'bio':
        aishackuser.bio = value
        aishackuser.save()
    elif key == 'first_name':
        aishackuser.user.first_name = value
        aishackuser.user.save()
    elif key == 'last_name':
        aishackuser.user.last_name = value
        aishackuser.user.save()

    return HttpResponse('')

def category(request, slug):
    category = shortcuts.get_object_or_404(Category, slug=slug)
    tutorials = utils.fetch_tutorials()

    tutorials_to_display = []
    for tut in tutorials:
        if tut[0]['category'] != category.id:
            continue

        tutorials_to_display.append(tut)

    context = utils.get_global_context(request)
    context.update({'current_page': 'category',
                    'category': category,
                    'tutorials_to_display': tutorials_to_display,
                    'show_sharing_buttons': settings.SHOW_SHARING_BUTTONS,
                    'show_sharing_buttons_inline': settings.SHOW_SHARING_BUTTONS_INLINE})

    return render(request, 'category.html', context)

def opencvbook(request):
    context = utils.get_global_context(request)
    context.update({'current_page': 'opencv-blueprints', 'nosidebar': 1})
    return render(request, 'opencv-blueprints.html', context);

def visionscrolls(request):
    context = utils.get_global_context(request)
    context.update({'current_page': 'vision-scrolls'})
    return render(request, 'vision-scrolls.html', context);

def namethatdataset(request):
    context = utils.get_global_context(request)
    context.update({'meta_thumb': '/static/img/quiz.jpg',
                    'meta_title': "Name that Dataset!", 
                    'meta_description': 'Think you\'ve seen enough datasets in your vision career? Here\'s a quiz - can you identify which dataset these images belong to?',
                    'current_page': 'name-that-dataset'})
    response = render(request, 'name-that-dataset.html', context);
    response.delete_cookie('quiz_session')

    return response

def namethatdataset_quiz(request):
    # TODO beautify this monstrocity please
    context = utils.get_global_context(request)

    # Are we mid game?
    session = request.COOKIES.get('quiz_session')

    # Did the user just land here?
    if not session:
        session = str(uuid.uuid4())

    full_key = lambda x: 'aishack.quiz.%s' % x

    # Did redis forget about us?

    in_redis = full_key(session) in redis

    # Did we finish a game and we returned again?
    if in_redis:
        session_data = json.loads(redis[full_key(session)])

        # Did we cross all the 10 questions?
        if session_data['state'] == 13:
            # Create a new session
            del redis[full_key(session)]
            in_redis = False
            session_data = {}
    
    if not in_redis:
        # No session information
        session_data = {}
        session_data['state'] = 0
        session_data['score'] = 0
        session_data['timestamp'] = time.time()
        session_data['done'] = []

        redis.setex(full_key(session), 900, json.dumps(session_data))

    datasets = {'voc-2012':     'VOC 2012',
                'caltech-101': 'Caltech 101',
                'caltech-256': 'Caltech 256',
                'sun09':       'Sun 09',
                'graz-01':     'Graz 01',
                'graz-02':     'Graz 02',
                'coil-100':    'Coil 100',
                None:           None}

    state = session_data['state']

    ans = request.GET.get('ans', None)
    if ans:
        ans = int(ans)

    prev_answer_success = None
    prev_answer_fail = None
    if 'expecting' in session_data and ans != None:
        if ans == session_data['expecting']:
            # Correct answer!
            prev_answer_success = session_data['expecting']
            session_data['score'] += 1
        elif ans != None:
            # Failed answer!
            prev_answer_fail = session_data['expecting']

        session_data['done'].append(session_data['pick'])
        del session_data['pick']
        session_data['state'] += 1
        state += 1


    # The image path to display
    src_img = None

    # The options
    opt1 = None
    opt2 = None
    opt3 = None
    opt4 = None

    topic_mapping = {0: 'cat', 1: 'cat',
                     2: 'dog', 3: 'dog',
                     4: 'person', 5: 'person',
                     6: 'cup', 7: 'cup',
                     8: 'airplane', 9: 'airplane',
                     10: 'car', 11: 'car'}

    topic = None
    if state in topic_mapping:
        topic = topic_mapping[state]
    else:
        topic = 'done'

        message = None
        score = session_data['score']
        if score >= 11:
            message = 'Your grace through math leaves people spellbound.'
            img = 'quiz-grand-master.png'
        elif score >= 9:
            message = 'You are almost there and you know it.'
            img = 'quiz-jedi-master.png'
        elif score >= 7:
            message = 'You understand the ways of the force.'
            img = 'quiz-jedi-knight.png'
        elif score >= 4:
            message = 'You are on the right path.'
            img = 'quiz-padawan.png'
        else:
            message = 'Your inner strength needs to be unleashed.'
            img = 'quiz-youngling.png'

        session_data['state'] += 1

        context.update({'topic': topic,
                        'score': session_data['score'],
                        'current_page': 'name-that-dataset',
                        'message': message,
                        'avatar': img,
        })
        response = render(request, 'name-that-dataset-quiz.html', context);
        del redis[full_key(session)]
        response.delete_cookie('quiz_session')
        return response
        

    key = 'question_%d' % state
    if key not in session_data:
        paths = os.listdir('./name-that-dataset/%s/' % (topic))
        while True:
            random.shuffle(paths)
            pick = '%s/%s' % (topic, paths[0])
            if pick not in session_data['done']:
                imglist = os.listdir('./name-that-dataset/%s/%s/' % (topic, paths[0]))
                random.shuffle(imglist)

                with open('./name-that-dataset/%s/%s/%s' % (topic, paths[0], imglist[0]), 'r') as fp:
                    src_img = base64.b64encode(fp.read())

                correct = paths[0]
                random.shuffle(paths)

                opt1 = paths[0]
                opt2 = paths[1]

                if len(paths) > 2:
                    opt3 = paths[2]

                if len(paths) > 3:
                    opt4 = paths[3]

                session_data['expecting'] = paths.index(correct)
                session_data['pick'] = pick
                
                session_data[key] = {}
                session_data[key]['src_img'] = src_img
                session_data[key]['opt1'] = opt1
                session_data[key]['opt2'] = opt2
                session_data[key]['opt3'] = opt3
                session_data[key]['opt4'] = opt4

                break
    else:
        src_img = session_data[key]['src_img']
        opt1 = session_data[key]['opt1']
        opt2 = session_data[key]['opt2']
        opt3 = session_data[key]['opt3']
        opt4 = session_data[key]['opt4']
        
    context.update({'current_page': 'name-that-dataset',
                    'score':    session_data['score'],
                    'state': session_data['state'] + 1,
                    'src_img':  src_img,
                    'opt1':     datasets[opt1],
                    'opt2':     datasets[opt2],
                    'opt3':     datasets[opt3],
                    'opt4':     datasets[opt4],
                    'topic':    topic,
                    'prev_answer_fail': prev_answer_fail,
                    'prev_answer_success': prev_answer_success,
                    'expecting': session_data['expecting'],
                  })

    redis.setex(full_key(session), 900, json.dumps(session_data))
    response = render(request, 'name-that-dataset-quiz.html', context);
    response.set_cookie('quiz_session', session)
    return response

def google_webmaster(request):
    return HttpResponse("google-site-verification: google64c35c9422bb35a3.html", content_type="text/html")

def starthere(request):
    context = utils.get_global_context(request)
    context.update({'current_page': 'start-here'})
    return render(request, 'start-here.html', context);

def entropy(request, date=None):
    context = utils.get_global_context(request)
    context.update({'current_page': 'entropy'})

    articles = []
    news_articles = sorted([x for x in os.listdir(settings.ENTROPY_PATH_BASE) if x.endswith('.md')])

    if date:
        news_articles = [x for x in news_articles if date in x]
        context.update({'contains_article': True})

    for post in reversed(news_articles):
        frontmatter, content = utils.parse_frontmatter_markdown(open('%s%s' % (settings.ENTROPY_PATH_BASE, post), 'r').readlines())

        news_fulldate = post[post.find('-')+1:post.find('.')]
        news_year = int(news_fulldate[0:4])
        news_month = int(news_fulldate[4:6])
        news_day = int(news_fulldate[6:])
        news_datetime = datetime.datetime(year=news_year, month=news_month, day=news_day)
        frontmatter['date'] = news_datetime.strftime('%b %d, %Y')
        frontmatter['link'] = news_datetime.strftime('%Y%m%d')
        articles.append(frontmatter)

        if date:
            context.update({'current_article': content})
            context.update({'current_article_frontmatter': frontmatter})

    article_count = len(articles)
    context.update({'articles': articles[0:min(article_count, settings.ENTROPY_ARTICLE_COUNT)]})

    if article_count > settings.ENTROPY_ARTICLE_COUNT:
        context.update({'old_articles': articles[settings.ENTROPY_ARTICLE_COUNT:]})
    return render(request, 'entropy.html', context)

class CustomSearchView(SearchView):
    form_class = SearchForm
    def get_queryset(self):
        queryset = super(CustomSearchView, self).get_queryset()
        return queryset

    def get_context_data(self, *args, **kwargs):
        context = super(CustomSearchView, self).get_context_data(*args, **kwargs)

        num_tutorials = 0
        num_series = 0
        num_categories = 0
        num_total = 0

        for obj in context['object_list']:
            if obj.object.__class__ == Tutorial:
                num_tutorials += 1
            elif obj.object.__class__ == TutorialSeries:
                num_series += 1
            elif obj.object.__class__ == Category:
                num_categories += 1

        num_total = num_categories + num_tutorials + num_series

        context.update({'num_tutorials': num_tutorials,
                        'num_series': num_series,
                        'num_categories': num_categories,
                        'num_total': num_total,
                        'current_page': 'search'})

        context.update(utils.get_global_context(None))
        return context

######
# Setup sitemaps for the website
class AishackSitemap(Sitemap):
    changefreq = 'daily'
    priority = 0.5
    protocol = 'https'

    def items(self):
        return Tutorial.objects.all()

    def lastmod(self, obj):
        return obj.date


