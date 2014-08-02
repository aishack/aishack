#!/usr/bin/env python

# A quite tool to convert data from the wordpress table (already ported to
# sqlite in output.db) into an md file with frontmatter

import sqlite3, sys
from html2text import HTML2Text

if len(sys.argv) == 1:
    print 'Usage: %s input.db' % sys.argv[0]
    sys.exit(0)

connection = sqlite3.connect(sys.argv[1])
cursor = connection.execute('SELECT * FROM wp_posts')
categories = connection.execute('SELECT * FROM wp_terms')
users = connection.execute('SELECT * FROM wp_users')

allResults = cursor.fetchall()
all_users = users.fetchall()
all_categories = categories.fetchall()

_index_ID         = 0
_index_author     = 1
_index_date       = 2
_index_date_gmt   = 3
_index_content    = 4
_index_title      = 5
_index_category   = 6
_index_excerpt     = 7
_index_status     = 8
_index_comment_status = 9
_index_ping_status = 10
_index_password   = 11
_index_name       = 12
_index_to_ping    = 13
_index_pinged     = 14
_index_modified   = 15
_index_modified_gmt = 16
_index_filtered   = 17
_index_parent     = 18
_index_guid       = 19
_index_menu       = 20
_index_type       = 21
_index_mime_type  = 22
_index_comment_count = 23

def find_user_email(id):
    """
    Use the all_users list to figure out the email ID of a user (that's specified
    in the front matter)
    """
    for i in all_users:
        if i[0] == id:
            return i[4]

def find_category_name(id):
    """
    Returns a human readable form of a category ID number
    """
    for i in all_categories:
        if i[0] == id:
            return i[1]
    return u'Uncategorized'

def generate_file_name(title):
    ret = title.lower()
    ret = '-'.join(ret.split(' '))
    ret = ret.replace('/', '-')

    return ret.encode('ascii', 'ignore')

h2t = HTML2Text()
h2t.body_width = 0
for result in allResults:
    if result[_index_status] != 'publish':
        continue

    html = result[_index_content]
    html = html.replace('\\r', '')
    html = html.replace('\\"', '"')
    html = html.replace("\\'", "'")
    output = h2t.handle(html)

    # Fetch what category this belongs to

    print 'Working on %s' % result[_index_title]
    f = open('markdown/%s.md' % generate_file_name(result[_index_title]), 'w')
    f.write('---\n')
    f.write('title: "%s"\n' % result[_index_title].encode('utf8'))
    f.write('date: "%s"\n' % result[_index_date])
    f.write('excerpt: "%s"\n' % result[_index_excerpt].encode('utf8'))
    f.write('category: "%s"\n' % find_category_name(result[_index_category]).encode('utf8'))
    f.write('author: "%s"\n' % find_user_email(result[_index_author]).encode('utf8'))
    f.write('---\n')
    f.write(output.encode('utf8'))
    f.close()
