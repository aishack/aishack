#!/usr/bin/python
import settings, knobs

import markdown, hashlib

from aishack.models import AishackUser, Tutorial, TutorialSeries
from django.contrib.auth.models import User
from aishack import settings

# Custom processors for markdowns
from aishack.extras.captions import FigcaptionExtension
from aishack.extras.mdx_custom_span_class import CustomSpanClassExtension
from aishack.extras.mdx_grid_table import GridTableExtension
from aishack.extras.subscript import SubscriptExtension
from aishack.extras.superscript import SuperscriptExtension
from aishack.extras.latex import MarkdownLatex

cache_global_context = None

def get_global_context(request):
    global cache_global_context

    if settings.DEBUG:
        cache_global_context = None

    if not cache_global_context:
        popular_tutorials = fetch_popular_tutorials(5)
        cache_global_context = popular_tutorials

    ret = {'SITE_TITLE': settings.SITE_TITLE,
            'POPULAR_TUTORIALS': cache_global_context,
            'knob_show_opencv_blueprints': knobs.show_opencv_blueprints,
            'knob_show_vision_scrolls': knobs.show_vision_scrolls,
            'knob_show_opencv_blueprints_banner_per_tutorial': knobs.show_opencv_blueprints_banner_per_tutorial,
            'knob_show_name_that_dataset': knobs.show_name_that_dataset,
            'knob_show_comments': knobs.show_comments,
            'knob_show_contribute': knobs.show_contribute,
            'knob_show_entropy': knobs.show_entropy,
            'meta_title': settings.SITE_TITLE, 
            'meta_description': knobs.meta_description,
            'knob_hide_sidebar': knobs.hide_sidebar,
            'meta_thumb': '/static/img/logo-footer-left.png',
            'mode_debug': settings.DEBUG,
        }
    return ret


def get_aishack_user(user):
    try:
        aishack_user = AishackUser.objects.get(user=user)
    except AishackUser.DoesNotExist, e:
        aishack_user = AishackUser(user=user)
        aishack_user.save()
    return aishack_user

def read_tutorial_file(slug):
    """
    Reads a .md file and returns a dictionary of information
    """

    fp = open('%s/tutorials/%s.md' % (settings.BASE_DIR, slug), 'r')
    lines = fp.readlines()
    fp.close()

    return parse_frontmatter_markdown(lines)

def parse_frontmatter_markdown(lines):
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

def fetch_tutorials(num=None, want_series=True):
    """
    Returns tutorials by combining multiple part tutorials into a single element
    """
    # This section defines what happens if the url is just /tutorials/
    tuts = list(Tutorial.objects.all().order_by('-date').values('post_image', 'post_thumb', 'slug', 'series', 'title', 'series_id', 'excerpt', 'category'))
    tutorials_to_display = []

    tuts_without_extras = tuts[:]
    count = len(tuts_without_extras)

    ## Cache series information for performance

    # Holds the first of a tutorial series
    series_first = {}
    # series_parts = {}
    series = {}

    for tut in tuts:
        series_id = tut['series_id']
        if not series_id:
            continue

        if series_id not in series: 
            # Calculate only the first tutorial here - that results in fewer queries
            # Evaluate the entire tutorial list later on
            series[series_id] = TutorialSeries.objects.get(pk=series_id)
            series_first[series_id] = series[series_id].first_tutorial()

        if tut['slug'] != series_first[series_id].slug:
            tuts_without_extras.remove(tut)
            count -= 1

    for tut in tuts_without_extras:
        series_id = tut['series_id']
        # if series_id:
        #     if series_id not in series_parts:
        #         series_parts[series_id] = series[series_id].tutorial_list()

        tup = (tut, None)
        if want_series and series_id in series:
            tup = (tut, series[series_id])

        tutorials_to_display.append(tup)

        if num and len(tutorials_to_display) == num:
            break

    return tutorials_to_display

def fetch_popular_tutorials(num=None):
    tuts = list(Tutorial.objects.order_by('-read_count').values('series_id', 'title', 'slug')[0:num])
    return tuts

def get_markdown_extensions():
    return [SuperscriptExtension(), 
            SubscriptExtension(), 
            GridTableExtension(), 
            CustomSpanClassExtension(), 
            FigcaptionExtension(), 
            MarkdownLatex(),
            'codehilite', 
            'tables']
