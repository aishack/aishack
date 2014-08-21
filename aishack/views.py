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

from aishack.models import Tutorial, AishackUser, Track, TutorialRead, UserTrack
from django.contrib.auth.models import User

import utils, settings

def index(request):
    """
    The home page
    """
    context = utils.get_global_context()
    context.update({'current_page': 'home'})

    # Fetch the first three featured tutorials
    featured_tutorials = Tutorial.objects.filter(featured=True)
    context.update({'featured': featured_tutorials})

    # Fetch the 3 recent tutorials
    recent_tutorials = Tutorial.objects.all().order_by('-date')[:3]
    context.update({'recent_tutorials': recent_tutorials})

    return render(request, "index.html", context)

def track_signup(request, slug=None):
    """
    Url to get user to signup for a track
    """
    context = utils.get_global_context()
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

    aishack_user = AishackUser.objects.get(user=request.user)

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

    context = utils.get_global_context()
    context.update({'current_page': 'track'})

    # We do have a slug
    track = shortcuts.get_object_or_404(Track, slug=slug)
    context.update({'track': track})

    list_of_tutorials = track.tutorials.all()
    context.update({'tutorials': list_of_tutorials})

    track_followed = False
    track_completed = False
    tuts_read = []
    if request.user.is_authenticated():
        aishack_user = AishackUser.objects.get(user=request.user)
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

    context = utils.get_global_context()
    context.update({'current_page': 'tutorials'})

    if slug:
        # This section defines what happens if a tutorial slug is mentioned
        tutorial = shortcuts.get_object_or_404(Tutorial, slug=slug)
        author = AishackUser.objects.get(user=tutorial.author)
        context.update({'tutorial': tutorial,
                        'page_title': tutorial.title,
                        'author': author.user,
                        'category_slug': str(tutorial.category.title).decode('ascii', 'ignore').lower().replace(' ', '_'),
                        'author_email_md5': md5(author.user.email).hexdigest(),
                        'aishackuser': author})

        if request.user.is_authenticated():
            aishack_user = utils.get_aishack_user(request.user)
            m = TutorialRead(tutorial=tutorial, user=aishack_user)
            m.save()

            # Increment the read counter
            tutorial.read_count = tutorial.read_count + 1
            tutorial.save()

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
            aishack_user = AishackUser.objects.get(user=request.user)
            tracks_following = aishack_user.tracks_following.all()
        else:
            tracks_following = []

        # Fetch all the tracks
        tracks = Track.objects.all()
        context.update({'tracks': tracks, 'tracks_following': tracks_following})

        # This section defines what happens if the url is just /tutorials/
        context.update({'tutorials': Tutorial.objects.all()})


    return render(request, "tutorials.html", context)

def contribute(request):
    """
    The tutorials home page
    """
    context = utils.get_global_context()
    context.update({'current_page': 'contribute'})
    return render(request, "contribute.html", context)

def about(request):
    """
    The tutorials home page
    """
    context = utils.get_global_context()
    context.update({'current_page': 'about'})
    return render(request, "about.html", context)

def login(request):
    context = utils.get_global_context()
    return render(request, "login.html", context)
