=== Plugin Name ===
Contributors: eyn
Donate link: http://www.channel-ai.com/blog/donate.php?plugin=flv-embed
Tags: flv, flash, video, media, embed, sitemap, Google
Requires at least: 2.5
Tested up to: 2.7
Stable tag: 1.2.1

Standards compliant Flash video (FLV) embedding in your blog posts. Supports video sitemap generation.

== Description ==

Adds FLV Flash videos into your blog. Video sitemap generation is supported.

For WordPress version older than 2.5, please download version 1.0 [here](http://wordpress.org/extend/plugins/flv-embed/download/ "FLV Embed older versions").

Features:

* uses simple, intuitive tags to generate Flash video (FLV) movies for your posts
* supports video sitemap generation
* standards compliant: valid XHTML
* many options are configurable, such as autostart, show/hide control bar, player colour, poster image, full screen button etc.
* supports text only output for RSS that prompt readers to visit the original post for Flash content
* supports outputting poster image for RSS if desired
* accessibility: requires Javascript to display FLV player, but will prompt user to enable Javascript when disabled
* accessibility: prompt user to download latest Flash player if it is not installed or too old
* accessibility: no annoying “click to activate” for IE users

== Screenshots ==

1. FLV Embed plugin in action
2. Video sitemap generated
3. FLV Embed option panel
4. FLV Embed sitemap option panel

== Usage ==

This plugin uses one universal, standard tag style:

	[flv:url width height]

* url - the URL of the FLV file you want to embed, the path can either be site-relative or absolute
* width - width of the FLV movie
* height - height of the FLV movie

More usage details can be found at the [plugin's homepage](http://www.channel-ai.com/blog/plugins/flv-embed/ "FLV Embed").

== Installation ==

1. Download and extract the “flv-embed” folder
1. Upload the “flv-embed” folder to your WordPress plugin directory, usually “wp-content/plugins”
1. Activate the plugin in your WordPress admin panel
1. For video sitemap feature to work properly, you should follow the instruction [here](http://www.channel-ai.com/blog/plugins/flv-embed/#sitemap)

== Frequently Asked Questions ==

= I keep getting “Get the latest Flash Player to see this player.” message even though I have the latest Flash player. Why? =

It is very likely that `wp_head()` function is missing in your theme’s header. To fix this, put the following code into your WordPress theme’s header file, right before the `</head>`:
	
`<?php wp_head(); ?>`

= Why doesn’t my flash video stretch properly? =

You need a better encoder. You can also try different settings for `$flv_overstretch` option. 

= Why are those ugly raw code showing up on my category, tags etc. page? =

This is because those entries do not have their excerpt defined, and WordPress is trying to generate one for you based on the post content, and you happen to have FLV embed tags at the top of the page! Unfortunately, I have yet to fix this problem because WordPress does not provide an easy hook for excerpt handling and I would need to literally hack WordPress to get this fixed. I will try to put this on my todo list but at the mean time, you can fix this yourself by manually adding excerpt to those posts affected.

= How can I change the location of the logo? =

Unfortunately you cannot, by default the logo will show at the top right corner. You might be able to manually add transparent padding to your png logo to shift the logo to where you want it to be, though it is not recommended.

= How can I align the video in the middle? =

Put the following code into your theme’s stylesheet:
	
`#player1, #player2, #player3 {text-align: center;}`

(for easy way of doing this, see [MyCSS](http://www.channel-ai.com/blog/plugins/mycss/) plugin)

= How can I embed a video from YouTube? =

Use the YouTube URL as the file argument when using the embed tags, e.g. `[flv:http://youtube.com/watch?v=fLV3MB3DpWN 480 360]`

= How long will it take for my videos to show up in Google’s search results once I submitted my video sitemap? =

I have no idea, but Google has already put video sitemap into action i.e. if you submit your video sitemap, they will be indexed and included in the search results at `video.google.com`.

= I have duplicate entries in my video sitemap?! =

Check the post with duplicate entries and manually delete the "flv" custom fields that are either empty or corrupted.

= I really like this plugin, what can I do to help? =

Your donation helps me continue the support and development of this plugin. On the other hand, you can also spread the love by sharing this (hopefully) useful plugin with your readers.

== History ==

1.2.1 [2009.01.13]

* Fixed: Poster image issues with YouTube embed

1.2 [2008.07.18]

* Upgraded FLV Player to 3.16
* Added: Custom FLV player location support
* Added: YouTube video support
* Added: Google Analytics support
* Added: Video smoothing option
* Added: Show download button option
* Added: Optional raw embed code for RSS
* Changed: Several options in admin panel to be more user friendly
* Fixed: wmode transparency issues
* Fixed: Poster image issues with non FLV files (e.g. mp4)

1.1 [2008.04.22]

* Upgraded FLV Player to 3.14
* Added: New video sitemap appearance
* Added: Auto remove invalid FLV files from custom field during custom field update
* Changed: Admin option panel for WordPress 2.5+
* Fixed: Only published post will be included in the video sitemap

1.0 [2007.12.30]

* Upgraded FLV Player to 3.12
* Added: Admin option panel
* Added: Video sitemap support
* Added: Option to show/hide volume button
* Added: Option to show/hide stop button
* Added: Option to show large control bar for visually impaired users

0.3.2 [2007.05.31]

* Added: Option to show poster image in feeds

0.3.1 [2007.05.19]

* Fixed: Poster path problem

0.3 [2007.05.10]

* Upgraded FLV Player to 3.7
* Switched to SWFObject instead of ufo.js
* Added: Option to show/hide logo with link
* Added: Option to set poster and flv movie path
* Added: Option to show/hide icons
* Added: Option to set volume
* Added: Optional tag parameter for poster path

0.2 [2007.02.16]

* Upgraded FLV Player to 3.5
* Added: Option to show/hide controller bar
* Added: Option to change buffer length
* Added: Option to set overstretch
* Fixed: IE display problem

0.1 [2007.01.09]

* Initial release
