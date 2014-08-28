#!/usr/bin/env python

# This tool ingests a given markdown file into the tutorial database

# standard imports
import sys, os
import markdown, re
from datetime import datetime

# Django specific imports
from django.core.management.base import BaseCommand, CommandError
from django.contrib.auth.models import User

from aishack.models import Tutorial, Category, TutorialSeries, TutorialSeriesOrder, Track, TrackTutorials

class Command(BaseCommand):
    help = "Ingest a tutorial markdown file into the database"
    args = "<md>"

    def read_tutorial_file(self, md, series=False):
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

        if 'date' in frontmatter:
            frontmatter['date'] = datetime.strptime(frontmatter['date'], '%Y-%m-%d %H:%M:%S')

        if 'featured' in frontmatter:
            frontmatter['featured'] = True if frontmatter['featured'] == 'true' else False
        else:
            frontmatter['featured'] = False

        # There is a second command to parse through series data
        if 'part' in frontmatter:
            frontmatter['part'] = int(frontmatter['part'])

        if 'track_order' in frontmatter:
            frontmatter['track_order'] = int(frontmatter['track_order'])

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
        for key in ['title', 'post_image', 'excerpt', 'date', 'category']:
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
            raise CommandError("Please specify a tutorial.md file to ingest")

        for md in args:
            print'\n\nProcessing: %s' % md
            # frontmatter is a dict, content is html
            frontmatter, content, content_md = self.read_tutorial_file(md)

            # Ensure all the required frontmatter exists
            self.confirm_frontmatter(frontmatter)

            # Print information just for info
            self.print_frontmatter(frontmatter)
            self.stdout.write('Parsing markdown successful!')

            if frontmatter['category'] == 'Uncategorized':
                raise CommandError("No category specified")

            # Get this into the django model
            try:
                category = Category.objects.get(title=frontmatter['category'])
            except Category.DoesNotExist, e:
                raise CommandError("Category doesn't exist: %s" % frontmatter['category'])


            # Get the author
            try:
                user = User.objects.get(email=frontmatter['author'])
            except User.DoesNotExist, e:
                raise CommandError('User does not exist: %s' % frontmatter['author'])

            slug = self.generate_slug(md)

            try:
                # If something with that title already exists, update that instead
                tutorial = Tutorial.objects.get(slug=slug)

                self.stdout.write('Tutorial already exists')

                tutorial.title      = frontmatter['title']
                tutorial.date       = frontmatter['date']
                tutorial.excerpt    = frontmatter['excerpt']
                tutorial.category   = category
                tutorial.slug       = slug
                tutorial.post_image = frontmatter['post_image']
                tutorial.content    = content
                tutorial.content_md = content_md
                tutorial.author     = user
                tutorial.featured   = frontmatter['featured']
                tutorial.series     = None

            except Tutorial.DoesNotExist, e:
                self.stdout.write('Tutorial does not exist - trying to create it')
                # It doesn't exist yet - create the tutorial object
                tutorial = Tutorial(title       = frontmatter['title'],
                                    date        = frontmatter['date'],
                                    excerpt     = frontmatter['excerpt'],
                                    category    = category,
                                    author      = user,
                                    slug        = slug,
                                    post_image  = frontmatter['post_image'],
                                    content     = content,
                                    featured    = frontmatter['featured'])

            # Run the INSERT/UPDATE query
            tutorial.save()
            self.stdout.write('Tutorial update successful!')

            if 'series' in frontmatter:
                try:
                    series = TutorialSeries.objects.get(name=frontmatter['series'])
                except TutorialSeries.DoesNotExist, e:
                    self.stdout.write('Series "%s" does not exist' % frontmatter['series'])
                    # Create a new tutorial series
                    series = TutorialSeries(name=frontmatter['series'])
                    series.save()

                tuts = series.tutorial_list()
                if tutorial not in tuts:
                    order = TutorialSeriesOrder(series=series, tutorial=tutorial, order=frontmatter['part'])
                    order.save()

                tutorial.series = series
                tutorial.save()

            if 'track' in frontmatter:
                try:
                    track = Track.objects.get(title=frontmatter['track'])
                except Track.DoesNotExist, e:
                    self.stdout.write('Track "%s" does not exist' % frontmatter['track'])

                    track = Track(title=frontmatter['track'])
                    track.save()

                tuts = track.tutorial_list()
                if tutorial not in tuts:
                    order = TrackTutorials(track=track, tutorial=tutorial, order=frontmatter['track_order'])
                    order.save()


            # Clear the cache for this particular tutorial (if it already existed there)
            # TODO


        self.stdout.write('Next steps:')
        self.stdout.write(' * python mange.py parse_series')
        self.stdout.write(' * python mange.py update_related_tutorials')
