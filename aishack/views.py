from django.http import Http404, HttpResponse
from django.template.loader import get_template
from django.template import Context
from django.shortcuts import render
import datetime, os
from hashlib import md5

from django.contrib.auth import logout

from aishack.models import Tutorial, AishackUser
from django.contrib.auth.models import User

import utils, settings

def index(request):
    """
    The home page
    """
    context = utils.get_global_context()
    context.update({'current_page': 'home'})
    return render(request, "index.html", context)

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
    else:
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
