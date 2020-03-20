#!/usr/bin/env python

# This tool ingests a given markdown file into the track database

# standard imports
import sys, os
import markdown, re
from datetime import datetime

# Django specific imports
from django.core.management.base import BaseCommand, CommandError
from django.contrib.auth.models import User

from aishack.models import Tutorial, Category, TutorialSeries, TutorialSeriesOrder, Track, TrackTutorials, AishackUser
from aishack.utils import get_markdown_extensions

class Command(BaseCommand):
    help = "Ingest a user markdown file"

    def read_user_file(self, md, series=False):
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
        html = markdown.markdown(content_lines, extensions=get_markdown_extensions())

        return (frontmatter, html, md)

    def print_frontmatter(self, fm):
        for key, value in fm.items():
            self.stdout.write('%10s: %s' % (key, value))

    def confirm_frontmatter(self, fm):
        """
        Ensures the following keys exist in the front matter dictionary: title, post_image
        excerpt, date, category
        """
        for key in ['email']:
            if key not in fm:
                raise CommandError("No '%s' found in frontmatter" % key)

    def generate_username(self, md):
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

    def add_arguments(self, parser):
        parser.add_argument('user', nargs='+', type=str)

    def handle(self, *args, **options):
        if 'user' not in options or len(options['user']) == 0:
            raise CommandError("Please specify a track.md file to ingest")

        for md in options['user']:
            print('\n\nProcessing: %s' % md)
            # frontmatter is a dict, content is html
            frontmatter, content, content_md = self.read_user_file(md)

            # Ensure all the required frontmatter exists
            self.confirm_frontmatter(frontmatter)

            # Print information just for info
            self.print_frontmatter(frontmatter)
            self.stdout.write('Parsing markdown successful!')


            try:
                # If something with that title already exists, update that instead
                user = User.objects.get(email=frontmatter['email'])
                aiuser = AishackUser.objects.get(user = user)

                self.stdout.write('User already exists')

                user.first_name   = frontmatter['firstname']
                user.last_name    = frontmatter['lastname']
                aiuser.short_bio  = frontmatter['short_bio']
                aiuser.website    = frontmatter['website']
                aiuser.bio        = content

                user.save()
                aiuser.save()

            except User.DoesNotExist as e:
                self.stdout.write('User does not exist - trying to create it')
                # It doesn't exist yet - create the track object
                username = self.generate_username(md)
                user = User(username = username,
                            first_name = frontmatter['firstname'],
                            last_name = frontmatter['lastname'],
                            email = frontmatter['email'],
                            is_staff = False,
                            is_superuser = False)
                user.save()
                
                aiuser = AishackUser(user = user,
                                     short_bio = frontmatter['short_bio'],
                                     website = frontmatter['website'],
                                     bio = content)
                aiuser.save()
            except AishackUser.DoesNotExist as e:
                aiuser = AishackUser(user = user,
                                     short_bio = frontmatter['short_bio'],
                                     website = frontmatter['website'],
                                     bio = content)
                aiuser.save()
               

            # Run the INSERT/UPDATE query
            self.stdout.write('User update successful!')

        self.stdout.write('Done.')
