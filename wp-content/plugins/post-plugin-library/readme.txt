=== Post-Plugin Library ===
Contributors: RobMarsh
Tags: posts, comments, random, recent, similar, related, popular, post-plugins
Requires at least: 1.5
Tested up to: 2.6.2
Stable tag: 2.6.2.1

The shared code library for Similar posts, Recent Posts, Random Posts, Popular Posts and Recent Comments.

== Description ==

The Post-Plugin Library does nothing by itself but **must** be installed to provide shared code for the [Similar Posts](http://wordpress.org/extend/plugins/similar-posts/), [Recent Posts](http://wordpress.org/extend/plugins/recent-posts-plugin/), [Random Posts](http://wordpress.org/extend/plugins/random-posts-plugin/), [Popular Posts](http://wordpress.org/extend/plugins/popular-posts-plugin/), and [Recent Comments](http://wordpress.org/extend/plugins/recent-comments-plugin/) plugins.

== Installation ==

1. IMPORTANT! If you are upgrading from a previous version first deactivate the plugin, then delete the plugin folder from your server. 

1. Upload the plugin folder to your /wp-content/plugins/ folder.

1. Go to the **Plugins** page and activate the plugin.

[My web site](http://rmarsh.com/) has [full instructions](http://rmarsh.com/plugins/) and [information on customisation](http://rmarsh.com/plugins/post-options/).

== Version History ==

* 2.6.2.1
	* support for recent comments to only show one comment per post
	* fix for donate link
* 2.6.2.0
	* new {imagealt} output tag -- rather like {imagesrc}
	* {excerpt} can now trim to whole sentences
	* content filter can now take parameter string
	* widget can now take parameter string
	* output can be appended to posts & feeds
* 2.6.1.0
	* the current post can be marked manually
	* widgets now honour the option to show no output if list is empty
	* {commenterlink} now respects the appropriate filter
* 2.6.0.0
	* version bump to indicate compatibility with WP 2.6
	* fix to really include attachments
	* new parameter for {imagesrc} to append a suffix to the image name, e.g. to get the thumbnail for attachments
* 2.5.0.11
	* new option to include attachments
	* {php} tag now accepts nested tags
	* new output tag {authorurl} -- permalink to archive of author's posts
	* fix for numeric locale issue in Similar Posts
* 2.5.10
	* new option to select algorithm for term extraction in Similar Posts
	* new manual links option in Similar Posts
	* fix for faulty non-English tag indexing in Similar Posts
	* fix for page selection in old versions of WP
	* made omit current post try harder to find current post ID
* 2.5.0.9
	* new option to order Recent Posts by date of last edit rather than date of creation
	* new option to match the current post's author
	* extended options for snippet and excerpt output tags
* 2.5.0.7
	* new option to show by status, i.e., published/private/draft/future
	* {categorynames} and {categorylinks} apply 'single_cat_name' filter
	* fixes bug in WP pre-2.2 causing installation code to fail
* 2.5.0.6
	* bug fix for new option for Recent Comments
* 2.5.0.5
	* new option for Recent Comments: just_current_post
	* {snippet} and {commentsnippet} now handle '...'
	* {commentexcerpt} now same parameters as (excerpt}
* 2.5.0.4
	* {commentpopupurl} targets the correct comment 
* 2.5.0.3
	* bug fix for showing pages when not selected
* 2.5.0.2
	* {image} tag has even more options
	* new {commentpopupurl} tag
* 2.5.0.1
	* made compatible with WP MU
* 2.5.0
	* {image} has new post, link, and default parameters
	* new {imagesrc} tag
	* fix to empty category bug
* 2.5b28
	* more work on {image} scaling
	* improvements to Similar Posts matching
	* experiment with Chinese/Korean/Japanese matching
* 2.5b27
	* made {image} scaling more robust
* 2.5b26
	* reverted thumnail serving (speed)
	* fix current post after extra query
* 2.5b25
	* option to sort output, group templates
	* removed 'trim_before' option added more logical 'divider'
	* {date:raw}, {commentdate:raw}, etc.
	* fix for {image} resizing when <img > and not <img />
	* {image} now serves real thumbnails
* 2.5b24
	* fix for recursive replacement by content filter
	* fix to {gravatar} to allow for 'identicon' etc.
	* fix to {commenter} to allow trimming
	* fix a warning in safe mode
* 2.5b23
	* new option to filter on custom fields
	* proper nesting of braces in {if}  ; also allowed in condition
	* improved bug report feature
	* better way to omit user comments
* 2.5b22
	* show_pages option now possible to show only pages
	* update for {postviews}
	* fix {commenterlink} giving no output
* 2.5b21
	* fix bug in {snippet} stripping
* 2.5b20
	* fix default behaviour of {gravatar}
* 2.5b18
	* new tag {if:condition:true:false}
* 2.5b17
	* enhanced {php}
* 2.5b16
	* fix submenus to work with Lighter Admin Drop Menu
* 2.5b15
	* fix bugs, add 'included posts' setting
* 2.5b14
	* enhanced bug reporter
* 2.5b13
	* added {gravatar}, extended {author}
* 2.5b11
	* fixed problem with bug reporter
* 2.5b9
	* clarifying installation instructions