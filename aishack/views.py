from django.http import Http404, HttpResponse
from django.template.loader import get_template
from django.template import Context
from django.core import exceptions
import datetime, os
from hashlib import md5

from django import shortcuts
from django.shortcuts import render, redirect

from django.contrib.auth import logout
from django.contrib import messages
from django.contrib.sitemaps import Sitemap

from aishack.models import Tutorial, AishackUser, Track, TutorialRead, UserTrack, TrackTutorials, Category
from django.contrib.auth.models import User

import utils, settings

def index(request):
    """
    The home page
    """
    context = utils.get_global_context(request)
    context.update({'current_page': 'home'})

    # Fetch the first three featured tutorials
    # Fetch the 3 recent tutorials
    featured_tutorials = Tutorial.objects.filter(featured=True)
    context.update({'featured': featured_tutorials, 'recent_tutorials': utils.fetch_tutorials(13)})

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
    context.update({'current_page': 'track'})

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
    _num_related = 3

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

        context.update({'tutorial': tutorial,
                        'track': track,
                        'track_length': track_length,
                        'tuts_in_track_read': 0,
                        'tuts_in_track_read_percent': 0,
                        'page_title': tutorial.title,
                        'author': author.user,
                        'category_slug': tutorial.category.slug,
                        'author_email_md5': md5(author.user.email).hexdigest(),
                        'aishackuser': author})

        # Increment the read counter
        tutorial.read_count = tutorial.read_count + 1
        tutorial.save(update_fields=['read_count'])

        if request.user.is_authenticated():
            aishack_user = utils.get_aishack_user(request.user)
            m = TutorialRead(tutorial=tutorial, user=aishack_user)
            m.save()

            # The user is logged in - update the related list based on which tutorials have
            # already been read
            related_list = []
            for tut in tutorial.related.all():
                all_read = aishack_user.tutorials_read.all()

                for t in all_read:
                    if tut.pk == t.pk:
                        break
                else:
                    related_list.append(tut)

                    if len(related_list) == _num_related:
                        break

            # Check if the user has signed up for the track
            tuts_read = aishack_user.tutorials_read.all()
            if track in aishack_user.tracks_following.all():
                tuts_in_track = track.tutorials.all()
                track_tuts_read = []

                tuts_in_track_read = 0
                for tut in tuts_in_track:
                    if tut in tuts_read:
                        tuts_in_track_read += 1
                        track_tuts_read.append(tut)

                context.update({'track_following': True,
                                'tuts_in_track_read': tuts_in_track_read,
                                'tuts_in_track_read_percent': tuts_in_track_read*100/track_length,
                                'track_tuts_read': track_tuts_read})

            # Maybe the visitor has read everything?
            # TODO
            if len(related_list) < _num_related:
                # fetch three random indices
                related_list.append(0)
        else:
            # The user isn't logged in - display the pre-processed related tutorials
            related_list = tutorial.related.all()[0:3]

        context.update({'related_tuts': related_list})
    else:
        # Fetch tracks the user is following
        if request.user.is_authenticated():
            aishack_user = utils.get_aishack_user(request.user)
            tracks_following = aishack_user.tracks_following.all()
        else:
            tracks_following = []

        # Fetch all the tracks
        tracks = Track.objects.all()
        context.update({'tracks': tracks, 'tracks_following': tracks_following})

        # This section defines what happens if the url is just /tutorials/
        # fetch_tutorials discards tutorials that are part of a series and only
        # returns the first part (along with a list of parts in the series)
        tutorials_to_display = utils.fetch_tutorials()
        context.update({'tutorials_to_display': tutorials_to_display})

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
                    'profile_email_md5': md5(user.user.email).hexdigest()})

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
    tutorials = Tutorial.objects.filter(category=category)

    context = utils.get_global_context(request)
    context.update({'current_page': 'category', 'category': category, 'tutorials': tutorials})

    return render(request, 'category.html', context)

def whylogin(request):
    context = utils.get_global_context(request)
    context.update({'current_page': 'why-login'})
    return render(request, 'why-login.html', context)

def opencvbook(request):
    context = utils.get_global_context(request)
    context.update({'current_page': 'opencv-blueprints'})
    return render(request, 'opencv-blueprints.html', context);

def visionscrolls(request):
    context = utils.get_global_context(request)
    context.update({'current_page': 'vision-scrolls'})
    return render(request, 'vision-scrolls.html', context);


######
# Setup sitemaps for the website
class AishackSitemap(Sitemap):
    changefreq = 'daily'
    priority = 0.5

    def items(self):
        return Tutorial.objects.all()

    def lastmod(self, obj):
        return obj.date
