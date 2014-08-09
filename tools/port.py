#!/usr/bin/env python

# A quite tool to convert data from the wordpress table (already ported to
# sqlite in output.db) into an md file with frontmatter

import sqlite3, sys, re, urllib
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
    ret = re.sub(r'[\?\!-_+:()]', '', ret)
    ret = '-'.join(ret.split(' '))
    ret = ret.replace('/', '-')

    return ret.encode('ascii', 'ignore')

def handle_links(content):
    """
    Converts old wordpress images into the new link format
    """
    content = content.replace('http://aishack.in/', '/')
    content = content.replace('http://www.aishack.in/', '/')
    content = re.sub(r'/wp-content/uploads/[0-9]{4}/[0-9]{2}/', '/static/img/tut/', content)
    content = re.sub(r'/[0-9]{4}/[0-9]{2}/', '/tutorials/', content)

    return content

def handle_latex(content):
    """
    Parses latex markdown into html
    """
    regex = re.compile(ur'.*?(\[latex\].*?\[/latex\]).*')
    content = content.replace('\r', '')

    m = regex.findall(content, re.DOTALL + re.UNICODE)
    if not m:
        return content

    while m:
        for match in m:
            formula = urllib.quote(match[7:-8].encode('ascii', 'ignore').decode('string_escape'))
            wp_img = '<img class="latex" src="http://s0.wp.com/latex.php?latex=%s&bg=ffffff&fg=000&s=0" />' % formula

            content = content.replace(match, wp_img)

        m = regex.findall(content, re.DOTALL + re.UNICODE)

    return content

def handle_caption(content):
    # Finds the general area
    regex = re.compile(ur'.*?(\[caption .*?\[/caption\])')

    # Finds the actual caption
    regexcaption = re.compile(ur'.*?caption=\"(.*?)\".*?')

    # Used for matching contents
    regexcontent = re.compile(ur'^\[caption .*?\](.*?)\[/caption\]')
    
    content = content.replace('\r', '')

    m = regex.findall(content, re.DOTALL + re.UNICODE)
    while m:
        for match in m:
            thecaption = regexcaption.findall(match)[0]
            thecontent = regexcontent.findall(match)[0]

            content = content.replace(match, '<br/><br/>%s<br/>:    %s<br/><br/>' % (thecontent, thecaption))

        m = regex.findall(content, re.DOTALL + re.UNICODE)

    return content

def handle_newline(content):
    content = content.replace('\r', '')
    regex = re.compile(r'(\n.*?\n\n)')

    m = regex.findall(content)
    while m:
        for match in m:
            content = content.replace(match, '<p>%s</p>' % match[1:-2])
        m = regex.findall(content)
    return content

def cleanup_extrawhitespaces(content):
    old_content = content
    content = content.replace('\n\n\n', '\n\n')

    while content != old_content:
        old_content = content
        content = content.replace('\n\n\n', '\n\n')

    return content

h2t = HTML2Text()
h2t.body_width = 0
counter = 1
for result in allResults:
    if result[_index_status] != 'publish':
        continue

    html = result[_index_content]
    html = html.replace('\\r', '')
    html = html.replace('\\"', '"')
    html = html.replace("\\'", "'")
    html = handle_links(html)

    if result[_index_title] == 'The Canny Edge Detector':
        import pdb; pdb.set_trace()
    html = handle_newline(html)
    html = handle_latex(html)
    html = handle_caption(html)
    output = h2t.handle(html)

    # Clean up the markdown output
    output = cleanup_extrawhitespaces(output)

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
    counter += 1
