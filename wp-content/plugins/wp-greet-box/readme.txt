=== WP Greet Box ===
Tags: referrer, search engine, seo, rss, landing sites, google, yahoo, social networks, digg, stumbleupon, delicious, technorati, twitter, live, blinklist, blogmarks, diigo, facebook, furl, magnolia, mister-wong, myspace, newsvine, reddit, simpy, youtube, flickr, tumblr, wordpress, linkedin, plurk, friendfeed, webdesignnews, dzone, designrfix, scoopeo
Contributors: madeinthayaland
Donate link: http://omninoggin.com/donate/
Requires at least: 2.7
Tested up to: 3.3.2
Stable Tag: 6.4.0

Display a different greeting message to your visitor depending on which site they are coming from.

== Description ==

This plugin lets you show a different greeting message to your new visitors
depending on their referrer url.  For example, when a Digg user clicks through
from Digg, they will see a message reminding them to digg your post if they
like it.  Another example, when a visitor clicks through from Twitter, they
will see a message suggesting them to twit the post and follow you on Twitter.
You can also set a default greeting message for new visitors (not matching any
referrer URLs) suggesting them to subscribe to your RSS feed.  Having these
targeted suggestions will help your blog increase exposure, loyal readership,
and reader interaction.  Best of all, this plugin is compatible with WPMU
and various WordPress cache plugins (so you do not have to sacrifice speed).

= Features =

* Show a different greeting message to your visitor depending on the referrer
  URL.  You can add/edit/delete/disable these greeting messages as you choose.
* Beautiful set of icons shipped along with the different default referrers.
* Clickable icon in greeting messages with target=_blank option.
* Greeting messages automatically get inserted into the top of your posts upon
  activation.  There is no need to modify theme files.
* Ability to auto-insert greeting message to the top or bottom of the post.
* Greeting messages can be user closeable or not.
* Ability to detect the visitor's search keywords from major search engines
  and automatically display related posts under or above the greeting message.
* Show a default greeting message even if the vistor does not match any of
  your configured referrer URL.
* Show a default greeting message even if the visitor does not have javascript
  enabled.
* Cache compatible mode makes use of AJAX to display greeting messages in the
  frontend.  This makes WP Greet Box compatible with other caching plugins
  (such as WP Super Cache) and WPMU.
* AJAX administrative interface that uses nonce verification to discourage
  hackers.
* Ability to keep displaying the greeting message until after the user clicks
  close for the first time.  After that, the greeting message will not show up
  for that user anymore.
* Ability to set a timeout to forget a visitor so we do not keep nagging them
  with greeting messages.
* Ablity to set rules to exclude some referrer URLs from seeing greeting
  messages.  Regular expressions is also supported (but not required!).
* Ultra customizeable greeting message box (with CSS) allowing you to
  prepend/append HTML around the greeting message box.
* Ability to disable included CSS for manual CSS management.
* Ability to disable included JS for manual JS management.
* Available "greet_box_text" filter for other plugins to modify greeting
  message before outputting.
* Ability to import and export all WP Greet Box Settings.
* Currently the following referrers are installed by default, but you can
  easily create your own if your favorite referrer is not on the list!
  1. bing.com
  1. blinklist.com
  1. blogmarks.com
  1. del.icio.us
  1. delicious.com
  1. designrfix.com
  1. digg.com
  1. diigo.com
  1. facebook.com
  1. flickr.com
  1. friendfeed.com
  1. furl.com
  1. google.*
  1. linkedin.com
  1. ma.gnolia.com
  1. mister-wong.com
  1. myspace.com
  1. netvibes.com
  1. newsvine.com
  1. plurk.com
  1. reddit.com
  1. scoopeo.com
  1. search.live.com
  1. search.msn.com
  1. search.yahoo.com
  1. simpy.com
  1. stumbleupon.com
  1. technorati.com
  1. twitter.com
  1. webdesign-ne.ws
  1. wikio.com
  1. youtube.com

== Installation ==

1. Upload the plugin to your plugins folder: 'wp-content/plugins/'
2. Activate the 'WP Greet Box' plugin from the Plugins admin panel.
3. (optional) Go to the Options -> WP Greet Box admin panel to make
   any customizations.
4. Test this out by googling for one of your articles and click through to your
   site from google.  You should see the greeting message custimized for a
   google visitor.

== Frequently Asked Questions ==

= Does this work with cache plugins? =
Yes it does!  Just make sure that you enable cache compatibility in WP Greet
Box advanced options and clear your cache afterwards.

= Does this work with WPMU? =
Yes it does (even when cache compatiblity mode is enabled)!

= Can I add additional greeting messages? =
Yes!  You can easily do this on the WP Greet Box options page.  You can even
modify preinstalled messages or delete them.

= I can't get it to work! I'm frustrated! =
Please take a look at more documentation available on the
[plugin page](http://omninoggin.com/projects/wordpress-plugins/wp-greet-box-wordpress-plugin/)
to see if any of them can help you.

== Changelog ==

= 6.4.0 =
* Tested with 3.3.2
* No longer showing attribution link by default.
* Changed donation phrasing.

= 6.3.3 =
* Added li_LT translation (Thanks Nata Strazda!).

= 6.3.2 =
* Fixed the following bugs that I've neglected for a while:
  * Greeting message not showing up for front page with static post/page.
  * Twitter message not showing up for Twitter referrers. (added t.co domain match by default)
  * Could not re-edit a greeting message without refreshing page.

= 6.3.1 =
* Fixed a few visual bugs in WP Admin (floating footer, broken image, buttons with bad text)

= 6.3.0 =
* Allow javascript to be embedded into greeting messages.

= 6.2.4 =
* Code changes to comply with WordPress plugin repository guidelines.
* Updating GPL copyright notice to 2008-2011 (only took me 6 months to notice this time!).

= 6.2.3 =
* Fixed minor bug

= 6.2.2 =
* Fixed file_get_contents() errors on some blogs

= 6.2.1 =
* Bug fixes

= 6.2.0 =
* Did some bug fixing. Lots of stability problems should be resolved in this
  release!

= 6.1.0 =
* Added ability to auto-insert to the first post on homepage.
* Another attempt to fix the white screen of death for some users.
* Externalized greeting messages.
* Cleaned up deprecated WP functions.

= 6.0.9 =
* Updated pt_BR translation (Thanks Isaac Ribeiro!).

= 6.0.8 =
* Added da_DK translation (Thanks Georg!).

= 6.0.7 =
* Updated it_IT translation (Thanks Gianni!).
* Tweaked admin UI a bit.

= 6.0.6 =
* Fixed "checked" bug for WP 2.7 users.
* Tweaked admin UI a bit.

= 6.0.5 =
* Fixed disappearing settings page.
* Fixed get_feed_permastruct() on non-object error.

= 6.0.4 =
* Fixed options upgrade bug (which probably fixes a lot of other errors people
  are seeing).

= 6.0.3 =
* Fixed corner case of fatal error in admin.

= 6.0.2 =
* Fixing broken WP Greet Box for new installations.

= 6.0.1 =
* Replacing PHP shorthands with long version.
* Updated it_IT translation (Thanks Gianni!).

= 6.0.0 =
* Re-architected the plugin to have a smaller footprint for visitors.
* Added DZone (Thank you Matthew Schmidt).
* Added UI on post/page edit form to exclude greet box from showing up on
  current post/page
* Updated it_IT translation (Thanks Gianni!).
* Fixed translation strings and updated .pot file.
* Fixed broken CSS when both rounded corners and drop shadow options are
  unchecked.

= 5.7.0 =
* Added Designerfix and Web Design News (Thank you Dale Crum!).
* Added be_BY translation by Marcis G.!.
* Fixed Google Buzz icon file name typo.

= 5.6.3 =
* Added fr_FR translation (Thank you The Alien!).

= 5.6.2 =
* Added Google Buzz Icon (Thanks Shahar!).

= 5.6.1 =
* Added hr translation (Thank you Yuraz!).

= 5.6.0 =
* Added support for rounded corners and drop shadow (CSS3 supported browsers)
* Added "Debug" mode that will always display messages (ignores most rules).
* Updated pt_BR translation (Thank you Isaac Ribeiro).
* Updated .pot file.
* Fixed admin CSS a bit.

= 5.5.8 =
* Fixed greet box showing up in excerpts for some people using automatic
  insertion.
* Updated .pot file.
* Added de_DE translation (Thank you Bjoern Buerstinghaus).

= 5.5.7 =
* Removed [caption] from extract.

= 5.5.6 =
* Added nl_NL translation (Thank you Lars Mennen).
* Added es_ES translation (Thank you Miquel Camps Orteza).

= 5.5.5 =
* Added zh_CN translation (Thank you Sam Zuo).
* Fixed admin CSS a bit.

= 5.5.4 =
* Fixed "otions" typo causing message display to logged in users to break.

= 5.5.3 =
* Added sq_AL translation (Thank you Romeo Shuka).

= 5.5.2 =
* Fixed greeting message not showing up in 5.5.1.
* Require WordPress 2.7+ now.

= 5.5.1 =
* Added wpgb_has_greet_message() for theme developers to check if the current
  page has a greeting message associate with it or not.

= 5.5.0 =
* Added ability to not show greeting message to logged in users.
* Added "About this plugin" section in admin area.

= 5.4.0 =
* Added new icons and messages for Netvibes, Wikio, and Scoopeo
  (Thank you Alain Mevellec)

= 5.3.4 =
* Added pt_BR translation (Thank you Isaac Ribeiro).

= 5.3.3 =
* Fixed "Expand related posts by default" option not saving.

= 5.3.2 =
* Updated it_IT translation (Thank you Gianni Diurno).

= 5.3.1 =
* Added it_IT translation (Thank you Gianni Diurno!).
* Fixed localization bug that was looking for lang/wp_greet_box-*.mo instead of
  lang/wp-greet-box-*.mo.

= 5.3.0 =
* Added ru_RU translation (Thank you M.Comfi!).
* Fixed exclusion rule that won't work per Window's end of line issue.
* Updated readme.txt format (Changelog).

= 5.2.0 =
* Added ability to not show greeting messages per post/page by adding
  "wpgb_hide" into a post/page's custom field.
* Moved documentation to omninoggin.com.
* Fixed "Cannot modify header information" warning in admin media library.
* Fixed fellow->follow typos in the default reddit message.
* Fixed i18n bug "$this->plugin_domain" (Thank you Lutz!)

= 5.1.0 =
* Added option to make the greet icon open up a new browser window when
  clicked on.
* Added POT file for translations.
* Added bing.com. (Thank you mynetx!)
* Updated Google icon. (Thank you Shahar!)
* Fixed svn:executable properties for php scripts and images.
* Removed legacy "Allow self referral option" (and always leave it on).

= 5.0.2 =
* Fixed greeting message showing up when it's not supposed to in PHP mode.
* Changed auto insertion filter content priority 100 (low priority)
* Remove OMNINOGGIN dashboard widget.

= 5.0.1 =
* Fixed array_slice() warning in the admin dashboard.
* Fixed version check to not break page when $wp_version is empty.

= 5.0 =
* Added ability to expand related posts by default.
* Added ability to display related posts before the greeting message.
* Added localization support.
* Added version checking.
* Cleaned up a lot of code.

= 4.9.1 =
* Fix page reload (in some cases) when closing greet box.

= 4.9 =
* Added the ability to keep displaying the greeting message until after the
  user clicks close for the first time.  After that, the greeting message
  will not show up for that user anymore.
* Added support for icon links so icons are now clickable.
* Fixed default CSS display for when the greet box is too long compared
  to the greeting message.
* Fixed PHP cookie writing outside of place bug in PHP mode (Thank you
  Daniel from Bonetree Blog!).
* Fixed cookie bug in PHP mode (causes message to show up too often).
* Fixed some XHTML stuff.
* Fixed other minor bugs.

= 4.8.1 =
* Fixed PHP & JS cookies conflict when switchng WP Greet Box modes.
* Fixed admin general configuration page not saving options.

= 4.8 =
* Added support for non-cache-compatible mode for people who do not use
  this plugin with any caching plugins.
* Added option to disable JS references for manual JS management.

= 4.7 =
* Added friendfeed.com, linkedin.com, and plurk.com along with
  corresponding icons.
* Made related posts not show up if no related results are found.

= 4.6.2 =
* Fixed WP Greet Box triggering wp-include/query.php WordPress core error
  for some themes.

= 4.6.1 =
* Fixed broken manual insertion.

= 4.6 =
* Added ability to import and export all WP Greet Box options
  (including greeting messages).
* Added option to disable CSS for manual CSS management.
* Enhance upgrade procedure.  Now all you have to do is visit any admin
  page after every upgrade.

= 4.5 =
* Added apply_filters("greet_box_text", $greet_html) filter for other
  plugins to modify message before display.
* Added icons for WordPress (thanks Joost De Valk!) and Tumblr

= 4.4.3 =
* Fixed WP 2.5 backwards compatibility (though pre WP 2.6 is not officially
  supported)
* Added option to allow self referral to trigger greet box.
* Added [[email-link]] short code for displaying "Subscribe via Email" links
  in greeting messages.

= 4.4.2 =
* Fixed MySQL index key conflicts by using a more unique index key name.
* Fixed XHTML validity with IMG tag and CSS file reference.
* Moved JS reference to the footer to help page load faster.

= 4.4.1 =
* Fix preg_match() error that occurs when there are slashes (/) specified
  in the referrer URL of each custom greeting message.

= 4.4 =
* Added more default greeting messages.
* Created and used my own set of free transparent icons.
* Added support for wildcard referrers (*.fr, *.uk).
* Added ability to specify multiple referrers per greeting message.
* Adjusted default CSS again.
* Fixed bug with stumbleupon & digg URLs that won't work on some sites.

= 4.3.3 =
* Fixed incompatibility on some web server setups which required URL escape.

= 4.3.2 =
* Fixed site_url() compatibility.

= 4.3.1 =
* Fixed /index.php to index.php in onload.js again.

= 4.3 =
* Added ability to detect the visitor's search keywords from major search
  engines and automatically display related posts under the greeting
  message.
* Fixed blank line bug in RSS feeds.

= 4.2.3 =
* Fixed bug that causes WP Greet Box to not work with sites with WordPress
  not installed in the root directory.
* Changed donation URL.

= 4.2.2 =
* Added ability to auto-insert greeting message before or after the post.
* Fixed default CSS (again).
* Fixed parse_url() incompatibilty in some version of PHP.
* Fixed blank line bug that shows up in IE when no greeting is shown.
* Fixed invalid reference to wp-greet-box/js/admin_functions.js.
* Hide advanced options in general configurations.
* Gave administration pages a bit of a facelift.

= 4.2.1 =
* Added optional "Powered by WP Greet Box" at the bottom right of messages.

= 4.2
* Auto-insert into the top of posts by default.
* Added ability to auto-insert into the top of pages.
* AJAXify adding new greeting message in administration.
* New settings to make messages closable or not.
* Easier exclusion rules (with regex toggle).
* Prevent self-referral to trigger greeting messages.
* Refferals are now per domain, instead of per URL.
* Fixed a bug that causes greeting messages to not work if one of the
  custom messages did not have a referrer URL specified.
* Fixed a bug that causes greeting messages to not work on non-default
  path WordPress installations.
* generic/stable CSS defaults.

= 4.1.1 =
* Modification so that Javscripts are only ran on pages with
     that has <? wp_greet_box() ?> calls.
* Fixed adding new message bug.

= 4.1 =
* Security patch using nonce verification on admin AJAX calls.

= 4.0.3 =
* Fixed regression AJAX bug.

= 4.0.2 =
* Fix some IE compatibility issues.
* Also fixed JavaScript to work with non-standard directory WordPress installs.

= 4.0.1 =
* Fix PHP4 compatibility issue.

= 4.0 =
* Greeting message now fades out when the close button is clicked.
* Frontend greeting message display now uses AJAX to display the proper
  greeting message.
* There is no longer a need to pre-generate a static wp-greet-box.js file for
  these greeting messages.  This also fixes the "Fatal error: Cannot redeclare
  wp_greet_box()" error that many people are getting from incorrect
  permissions.
* Greeting message administration UI became a lot easier and quicker after
  AJAXification.

= 3.1.1 =
* Fixed a bug that caused the greet box to not show up if exclusion rules are
  not specified.

= 3.1 =
* Added referral URL exclusion rules capabilities.
* Added noscript support for users with javascript disabled.
* Paginate admin pages.

= 3.0 =
* Added cookies support so we do not keep showing the same message to
     returning visitors.
* Added default message when no referrer match is found.

= 2.1 =
* Fixed PHP4 incompatibility.

= 2.0 =
* Added ability for users to add/delete/disable greeting messages.
* Added confirmation dialogs for delete and reset function.

= 1.0 =
* Initial release

== Screenshots ==

1. Display message to google visitors.
2. Display related posts based on most search engine keywords.
3. Ask visitors from stumbleupon.com to thumbs up your post.
4. Display default message to visitors not matching any special referrer.
5. AJAXed message administration.
6. Buckets for active and inactive messages.
7. Exclusion rules with optional regex support.
8. General settings with advanced options hidden by default.
