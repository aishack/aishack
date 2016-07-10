#!/usr/bin/env python

# This tool ingests a given markdown file into the track database

# standard imports
import sys, os
import markdown, re
from datetime import datetime

# Django specific imports
from django.core.management.base import BaseCommand, CommandError
from django.contrib.auth.models import User

from aishack.models import Tutorial, Category, TutorialSeries, TutorialSeriesOrder, Track, TrackTutorials

class Command(BaseCommand):
    help = "Ingest a track markdown file into the database"
    args = "<md>"

    def read_track_file(self, md, series=False):
        if not os.path.exists(md):
            raise CommandError("File doesn't exist: %s" % md)

        # Read in the contents of the file
        with open(md, 'r') as fp:
            lines = fp.readlines()

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
                data = line.split(':', 1)

                # Strip away any whitespaces or "
                key = data[0].strip()
                value = data[1].strip().strip('"')

                frontmatter[key] = value

            counter += 1

        counter += 1
        content_lines = ''.join(lines[counter+1:])
        md = content_lines.decode('utf8')
        html = markdown.markdown(md, extensions=['superscript', 'subscript', 'mdx_grid_table', 'mdx_custom_span_class', 'captions', 'codehilite', 'tables'])

        return (frontmatter, html, md)

    def print_frontmatter(self, fm):
        for key, value in fm.items():
            self.stdout.write('%10s: %s' % (key, value))

    def confirm_frontmatter(self, fm):
        """
        Ensures the following keys exist in the front matter dictionary: title, post_image
        excerpt, date, category
        """
        for key in ['title', 'thumbnail', 'excerpt']:
            if key not in fm:
                raise CommandError("No '%s' found in frontmatter" % key)

    def generate_slug(self, md):
        # fetch the basename of the file and make it lower case
        ret = os.path.basename(md).lower()

        # Get rid of the .md
        ret = ret.split('.')[0]

        # remove special characters
        ret = re.sub(r'[\?\!_+:()]', '', ret)

        # Convert spaces into -
        ret = '-'.join(ret.split(' '))

        # Any / in the file name should be converted into a -
        ret = ret.replace('/', '-')

        # Return a value that works with just ascii
        return ret.encode('ascii', 'ignore')

    def handle(self, *args, **options):
        if len(args) == 0:
            raise CommandError("Please specify a track.md file to ingest")

        for md in args:
            print'\n\nProcessing: %s' % md
            # frontmatter is a dict, content is html
            frontmatter, content, content_md = self.read_track_file(md)

            # Ensure all the required frontmatter exists
            self.confirm_frontmatter(frontmatter)

            # Print information just for info
            self.print_frontmatter(frontmatter)
            self.stdout.write('Parsing markdown successful!')

            slug = self.generate_slug(md)

            try:
                # If something with that title already exists, update that instead
                track = Track.objects.get(slug=slug)

                self.stdout.write('Track already exists')

                track.title      = frontmatter['title']
                track.excerpt    = frontmatter['excerpt']
                track.slug       = slug
                track.thumbnail = frontmatter['thumbnail']
                track.description= content

            except Track.DoesNotExist, e:
                self.stdout.write('Track does not exist - trying to create it')
                # It doesn't exist yet - create the track object
                track = Track(title       = frontmatter['title'],
                              excerpt     = frontmatter['excerpt'],
                              slug        = slug,
                              thumbnail   = frontmatter['thumbnail'],
                              description = content)

            # Run the INSERT/UPDATE query
            track.save()
            self.stdout.write('Track update successful!')

        self.stdout.write('Next steps:')
