#!/usr/bin/python
import settings

import markdown

from aishack.models import AishackUser, Tutorial
from django.contrib.auth.models import User

def get_global_context():
    popular_tutorials = Tutorial.objects.all().order_by('-read_count')[0:5]
    return {'SITE_TITLE': settings.SITE_TITLE,
            'POPULAR_TUTORIALS': popular_tutorials}

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
