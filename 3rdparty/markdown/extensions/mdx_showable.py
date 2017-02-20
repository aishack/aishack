##
# BSD 3-clause licence
#
# Copyright (c) 2015, Andrew Robinson
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
# 
# * Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer.
# 
# * Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
# 
# * Neither the names of python-md-showable AND/OR mdx_showable nor the names of its
#   contributors may be used to endorse or promote products derived from
#   this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
##

'''
A python markdown extension which creates sections of showable text

Adds tags (latex style)

\showable{link text}
OR
\showable{link text}{customCSSclass}

OTHER MARKDOWN CONTENT

\endshowable

NOTE: you can use nested showables as well (one in another)

Created on 15/05/2015
@author: Andrew Robinson
'''

from __future__ import absolute_import
from __future__ import unicode_literals

import sys
import markdown
from markdown.extensions import Extension
from markdown.blockprocessors import BlockProcessor, ListIndentProcessor
from markdown.util import etree
import re

## Set the version Number
__version__ = '0.1.2'


class ShowableProcessor(BlockProcessor):
    """Create sections of output that can be shown"""
    
    REstart = re.compile(r'^(?P<pre>.*)\\showable(?P<mod>[+]?){(?P<title>[^}|]*)(\|(?P<hidetitle>[^}|]+))?}({(?P<class>[a-zA-Z0-9_ ]*)})?(?P<post>.*)$',re.DOTALL)
    REend = re.compile(r'^(?P<pre>.*)\\endshowable(?P<post>.*)$',re.DOTALL)
    _id = 0
    _first = True
    
    def test(self, parent, block):
        return bool(self.REstart.search(block)) or bool(self.REend.search(block))
    
    def run(self, parent, blocks):
        raw_block = blocks.pop(0)
        matchStart = self.REstart.search(raw_block)
        if matchStart is not None:
            matchVars = matchStart.groupdict()
            
            # get my id
            myid = self._id
            self._id += 1
            
            ## setup classes and variables
            # classes
            containercls = "showable-container"
            headercls = "showable-header"
            bodycls = "showable-body"
            if 'class' in matchVars and matchVars['class'] is not None:
                containercls += " %s" % matchVars['class']
                headercls += " %s" % matchVars['class']
                bodycls += " %s" % matchVars['class']
            
            # title parts
            titlePrefix = matchVars['pre']
            title = matchVars['title']
            # check (and allow for) end on same line as start
            matchEnd2 = self.REend.search(matchVars['post'])
            if matchEnd2 is not None:
                matchVars2 = matchEnd2.groupdict()
                titleSuffix = matchVars2['pre']
                blocks.insert(0, "\endshowable") 
                blocks.insert(1, matchVars2['post'])
            else:
                titleSuffix = matchVars['post']
            # alternating title
            hidetitle = ""
            if "hidetitle" in matchVars and matchVars["hidetitle"]:
                hidetitle = matchVars["hidetitle"]
                
            # check for children
            myblocks = self._removeUntilMatching(blocks)
            
            # conditions
            hasChildren = len(myblocks) > 0
            isHidden = ("+" not in matchVars['mod'])
            
            if isHidden:
                containercls += " showable-hidden"
            
            
            ## create html
            # create container for showable
            divsh = etree.SubElement(parent, 'div')
            divsh.set("id", "showable%s" % (myid, ))
            divsh.set("class", containercls)
            divshi = etree.SubElement(divsh, 'div')
            divshi.set("class", "showable-inner")
            
            
            # create the header
            divt = etree.SubElement(divshi, 'div')
            divt.set("id", "showabletitle%s" % (myid, ))
            divt.set("class", headercls)
                
            divt.text = titlePrefix
            
            if hasChildren:
                titlespan = etree.SubElement(divt, 'a')
                titlespan.set("href", "")
            else:
                titlespan = etree.SubElement(divt, 'span')
                titlespan.set("class", "link-like")
            titlespan.set("id", "showablelink%s" % (myid, ))
            #titlespan.text = title
            self.parser.parseChunk(parent, title)
            titlespan.tail = titleSuffix
            
                
            # hack in (once) the delayed java-script code as its not possible to add it into the template without editing it.
            # @see http://writing.colin-gourlay.com/safely-using-ready-before-including-jquery/
            if self._first:
                scriptjq = etree.SubElement(parent, 'script')
                scriptjq.text = '''(function(w,d,u){w.readyQ=[];w.bindReadyQ=[];function p(x,y){if(x=="ready"){w.bindReadyQ.push(y);}else{w.readyQ.push(x);}};var a={ready:p,bind:p};w.$=w.jQuery=function(f){if(f===d||f===u){return a}else{p(f)}}})(window,document)'''
                self._first = False
            
            # create showable body
            if len(myblocks) > 0:
                divb = etree.SubElement(divshi, 'div')
                divb.set("id", "showablebody%s" % (myid, ))
                divb.set("class", bodycls)
                
                # add children
                self.parser.parseBlocks(divb, myblocks)
                
                # add the toggle handler
                labelswap=""
                if hidetitle:
                    labelswap = '''
            if ($("#showable{ID}").hasClass("showable-hidden")) {{
                $("#showablelink{ID}").text("{showtitle}");
            }} else {{
                $("#showablelink{ID}").text("{hidetitle}");
            }}'''.format(ID=myid, hidetitle=matchVars['hidetitle'], showtitle=matchVars['title'])
                
                script = etree.SubElement(parent, 'script')
                script.text = '''
    $(document).ready(function(){{
        $("#showablelink{ID}").click(function(e){{
            e.preventDefault();
            $("#showable{ID}").toggleClass("showable-hidden");{labelswap}
        }});
    }});
    '''.format(ID=myid, labelswap=labelswap)
            
        # endif
    # end run()
            
    def _removeUntilMatching(self, blocks):
        
        myblocks = []
        depth = 1
        while len(blocks) > 0:
            raw_block = blocks.pop(0)
            matchStart = self.REstart.search(raw_block)
            matchEnd = self.REend.search(raw_block)
            if matchStart is not None:
                depth += 1
            elif matchEnd is not None:
                if matchEnd.groupdict()['pre'].strip() != "":
                    myblocks.append(matchEnd.groupdict()['pre'].strip())
                if matchEnd.groupdict()['post'].strip() != "":
                    blocks.insert(0, matchEnd.groupdict()['post'].strip())
                depth -= 1
                if depth <= 0:
                    break
            # endif
            
            myblocks.append(raw_block)
        # next block
        
        return myblocks

class ShowableExtension(Extension):
    """ Add definition lists to Markdown. """

    def extendMarkdown(self, md, md_globals):
        """ Add an instance of ShowableProcessor to BlockParser. """
        md.parser.blockprocessors.add('showable',
                                      ShowableProcessor(md.parser),
                                      '>ulist')

def makeExtension(*args, **kwargs):
    return ShowableExtension(*args, **kwargs)

# ----- TESTING -----
mdtext = '''
This is a paragraph and this should be --special--

And another paragraph

with a showable

Where is this \showable{Reveal Answer}{answer} Helloworld

*Here is a paragraph*

\showable{Reveal Answer}{hint}

And and other
\endshowable

But these should be hidden until end of time (or the user shows them)
\endshowable
helloworld
'''

if __name__ == "__main__":
    print (markdown.markdown(mdtext, ['showable']))

