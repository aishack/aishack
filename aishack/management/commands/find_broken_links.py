#!/usr/bin/env python

# This tool ingests a given markdown file into the track database

# standard imports
import sys, os
from datetime import datetime

# Django specific imports
from django.core.management.base import BaseCommand, CommandError
from django.test.client import Client

from xml.etree import ElementTree
from BeautifulSoup import BeautifulSoup

class Command(BaseCommand):
    help = "Goes through the sitemap to ensure there are no broken links on the website"

    def handle(self, *args, **options):
        start_at = '/sitemap.xml'
        if len(args) == 1:
            start_at = args[0]

        # Initiate the test client and fetch the sitemap
        c = Client()
        sitemap = c.get('/sitemap.xml')

        if sitemap.status_code != 200:
            raise CommandError("Fetching the sitemap returned status code: %s" % sitemap.status_code)

        # Ensure the root node is what's expected
        root = ElementTree.fromstring(sitemap.content)
        if not root.tag == '{http://www.sitemaps.org/schemas/sitemap/0.9}urlset':
            raise CommandError("The root node is not what was expected. Found: %s" % root.tag)

        # Fetch locations from the sitemap
        unprocessed = set()
        broken = {}
        processed = set()
        img_unprocessed = set()
        img_processed = set()
        for url in root:
            for child in url:
                if child.tag == '{http://www.sitemaps.org/schemas/sitemap/0.9}loc':
                    tempurl = child.text
                    tempurl = tempurl.replace('http://testserver', '')
                    unprocessed.add( (tempurl, tempurl) )
                    break

        # Now start going through the se!
        count = 1
        while len(unprocessed) > 0:
            print('Processing link %s/%s' % (count, len(unprocessed)))
            current, origin = unprocessed.pop()

            processed.add(current)
            response = c.get(current)

            if response.status_code != 200:
                broken[origin] = broken.get(origin, [])
                broken[origin].append(current)

            new_links, img_links = self.parse_links(response.content)
            for link in new_links:
                if link not in processed and link not in [x[1] for x in unprocessed]:
                    unprocessed.add( (link, current) )

            for img in img_links:
                if img not in img_processed:
                    # Ignore specific external images
                    if ('http://gravatar.com/avatar' in img or
                       'http://s0.wp.com/latex.php' in img or
                       'assoc-amazon.com' in img):
                       continue

                    if not os.path.exists('/work/aishack/%s' % img):
                        broken[origin] = broken.get(origin, [])
                        broken[origin].append(img)

                    img_processed.add(img)

            count += 1

        self.stdout.write('Processed %s links' % len(processed))
        self.stdout.write('Broken links: %s' % len(broken))
        for origin, links in broken.items():
            self.stdout.write('    %s' % origin)
            for l in links:
                self.stdout.write('      %s' % l)

    def parse_links(self, content):
        """
        Parses a given piece of content and returns a set of links
        """
        ret = set()

        soup = BeautifulSoup(content)
        all_a = [x['href'] for x in soup.findAll('a')]
        all_img = [x['src'] for x in soup.findAll('img') if x['src']]

        for x in all_a:
            # Special exception for /tracks/signup/... - that URL always redirects
            if 'login' in x or not x.startswith('/') or x.startswith('/tracks/signup/'):
                continue

            ret.add(x)

        return ret, all_img
