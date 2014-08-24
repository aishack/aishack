#!/usr/bin/python
import settings

import markdown, hashlib

from aishack.models import AishackUser, Tutorial
from django.contrib.auth.models import User

def get_global_context(request):
    popular_tutorials = [tut[0] for tut in fetch_tutorials(5)]

    ret = {'SITE_TITLE': settings.SITE_TITLE,
            'POPULAR_TUTORIALS': popular_tutorials}

    if request.user.is_authenticated():
        ret.update({'user_email_md5': hashlib.md5(request.user.email).hexdigest()})

    return ret


def get_aishack_user(user):
    aishack_user = AishackUser.objects.get(user=user)
    return aishack_user

def read_tutorial_file(slug):
    """
    Reads a .md file and returns a dictionary of information
    """

    fp = open('%s/tutorials/%s.md' % (settings.BASE_DIR, slug), 'r')
    lines = fp.readlines()
    fp.close()

    # If we reach here, we were successful in opening the file!
    ret = {}

    # Parse the front matter
    first = True
    second = False
    counter = 0
    frontmatter = {}
    for line in lines:
        if '---' in line and first:
            # We found the first one, now onto the second one
            first = False
            second = True
            continue

        if '---' in line and second:
            # We found the end of the front matter
            second = False
            break

        # We already found the first --- and are looking for the second ---
        if not first and second:
            data = line.split(':')

            # Strip away any whitespaces or "
            key = data[0].strip()
            value = data[1].strip().strip('"')

            frontmatter[key] = value

        counter += 1

    content_lines = ''.join(lines[counter+1:])
    html = markdown.markdown(content_lines.decode('utf8'))

    return (frontmatter, html)

def fetch_tutorials(num=None):
    """
    Returns tutorials by combining multiple part tutorials into a single element
    """
    # This section defines what happens if the url is just /tutorials/
    tuts = Tutorial.objects.all().order_by('-date')
    tutorials_to_display = []

    tuts_without_extras = tuts[:]
    for tut in tuts:
        series = tut.series
        if not series:
            continue

        series = series.tutorial_list()
        if tut.slug != series[0].slug:
            tuts_without_extras = tuts_without_extras.exclude(slug=tut.slug)

    for tut in tuts_without_extras:
        series = []
        if tut.series:
            series = tut.series.tutorial_list()

        tup = (tut, None)
        if series:
            tup = (tut, tut.series)

        tutorials_to_display.append(tup)

        if num and len(tutorials_to_display) == num:
            break

    return tutorials_to_display
