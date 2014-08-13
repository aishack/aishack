from django.http import Http404, HttpResponse
from django.template.loader import get_template
from django.template import Context
from django.shortcuts import render
import datetime, os
from hashlib import md5

from django.contrib.auth import logout

from aishack.models import Tutorial, AishackUser, Track, TutorialRead
from django.contrib.auth.models import User

import utils, settings

def index(request):
    """
    The home page
    """
    context = utils.get_global_context()
    context.update({'current_page': 'home'})
    return render(request, "index.html", context)

def tracks(request, slug=None):
    """
    The tracks home page
    """
    context = utils.get_global_context()
    context.update({'current_page': 'track'})

    if slug:
        track = Track.objects.get(slug=slug)
        context.update({'track': track})

        list_of_tutorials = track.tutorials.all()
        context.update({'tutorials': list_of_tutorials})

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
        else:
            list_read = [False] * len(list_of_tutorials)
        context.update({'tutorials_read': list_read})


    return render(request, 'tracks.html', context)

def tutorials(request, slug=None):
    """
    The tutorials home page
    """
    context = utils.get_global_context()
    context.update({'current_page': 'tutorials'})

    if slug:
        # This section defines what happens if a tutorial slug is mentioned
        tutorial = Tutorial.objects.get(slug=slug)
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
    else:
        # Fetch all the tracks
        tracks = Track.objects.all()
        context.update({'tracks': tracks})

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
