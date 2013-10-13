<?php
if (!class_exists('WPGreetBoxAdmin')) {

  class WPGreetBoxAdmin {

    // objects
    var $p = null;

    function WPGreetBoxAdmin($plugin) {
      $this->p = $plugin;

      // activation hook
      register_activation_hook(dirname(dirname(__FILE__)).'/wp-greet-box.php', array($this, 'activate'));

      // register admin hooks
      add_action('admin_init', array($this, 'request_handler'));
      add_action('admin_init', array($this, 'register_scripts'));
      add_action('admin_init', array($this, 'register_styles'));
      add_action('admin_head', array($this->p->c, 'a_check_version'));
      add_action('admin_menu', array($this, 'menu'));
      add_action('wp_ajax_'.$this->p->name, array($this, 'ajax_request_handler'));

      // post options
      add_action('edit_form_advanced', array($this, 'post_options'));
      add_action('draft_post', array($this, 'store_post_options'));
      add_action('publish_post', array($this, 'store_post_options'));
      add_action('save_post', array($this, 'store_post_options'));
    }

    function default_options() {
      return array(
        'version'               => $this->p->version,
        'before_greet'          => '<div class="greet_block">',
        'after_greet'           => '</div>',
        'before_icon'           => '<div class="greet_image">',
        'after_icon'            => '</div>',
        'before_text'           => '<div class="greet_text">',
        'after_text'            => '<div style="clear:both"></div></div>',
        'exclude_referrer'      => 'friendfeed.com'.chr(10).'google.com/reader',
        'can_close'             => 1,
        'can_close'             => 1,
 	'debug'                 => 0,
 	'corners'               => 1,
 	'drop_shadow'           => 0,
        'regex_rules'           => 0,
        'show_post'             => 1,
        'show_page'             => 0,
        'show_home'             => 0,
        'position'              => 'before',
        'show_link'             => 0,
        'show_advanced_options' => 0,
        'show_related'          => 1,
        'show_related_excerpt'  => 1,
        'target_blank'          => 0,
        'open_related'          => 0,
        'enable_css'            => 1,
        'enable_js'             => 1,
        'cache_compatible'      => 1,
        'show_logged_in'        => 1,
        'related_limit'         => 5,
        'related_excerpt_len'   => 20,
        'related_position'      => 'after',
        'rss_link'              => get_bloginfo('rss_url'),
        'email_link'            => '',
 	'deprecated'            => array(),
        'called'                => 0,
        'l_called'              => 10,
        'message_default'       => array(
          'disable'         => 0,
          'icon'            => $this->p->c->get_plugin_url().'images/rss_icon.png',
          'icon_link'       => '[[rss-link]]',
          'show_till_close' => 1,
          'timeout'         => 14400,
          'text'            => __('Hello there! If you are new here, you might want to <a href="[[rss-link]]" rel="nofollow"><strong>subscribe to the RSS feed</strong></a> for updates on this topic.', $this->p->name)
        ),
        'message_noscript'      => array(
          'disable'         => 0,
          'icon'            => $this->p->c->get_plugin_url().'images/rss_icon.png',
          'icon_link'       => '[[rss-link]]',
          'text'            => __('Hello there! If you are new here, you might want to <a href="[[rss-link]]" rel="nofollow"><strong>subscribe to the RSS feed</strong></a> for updates on this topic.', $this->p->name)
        ),
        'messages'              => array(
          array(
            'referrer'        => 'del.icio.us, delicious.com',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/delicious_icon.png',
            'icon_link'       => 'http://delicious.com/save?jump=yes&url=[[escaped-permalink]]&title=[[title]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello fellow <strong>Delicious</strong> user! Feel free to <a href="http://delicious.com/save?jump=yes&url=[[escaped-permalink]]&title=[[title]]" rel="nofollow"><strong>bookmark this page</strong></a> for future reference if you like it!', $this->p->name)
          ),
          array(
            'referrer'        => 'digg.com',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/digg_icon.png',
            'icon_link'       => 'http://digg.com/submit?url=[[escaped-permalink]]&title=[[title]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello fellow <strong>Digger</strong>! If you like this article, please help me out by giving me some <a href="http://digg.com/submit?url=[[escaped-permalink]]&title=[[title]]" rel="nofollow"><strong>digg love</strong></a>!', $this->p->name)
          ),
          array(
            'referrer'        => 'google.*',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/google_icon.png',
            'icon_link'       => '[[rss-link]]',
            'show_till_close' => 1,
            'timeout'         => 1440,
            'text'            => __('Welcome <strong>Googler</strong>! If you find this page useful, you might want to <a href="[[rss-link]]" rel="nofollow"><strong>subscribe to the RSS feed</strong></a> for updates on this topic.', $this->p->name)
          ),
          array(
            'referrer'        => 'stumbleupon.com',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/stumbleupon_icon.png',
            'icon_link'       => 'http://www.stumbleupon.com/submit?url=[[escaped-permalink]]&title=[[title]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello fellow <strong>Stumbler</strong>! Don\'t forget to <a href="http://www.stumbleupon.com/submit?url=[[escaped-permalink]]&title=[[title]]" rel="nofollow"><strong>give me a thumbs up</strong></a> and <a href="[[rss-link]]" rel="nofollow"><strong>subscribe to the RSS feed</strong></a> if you like this page!', $this->p->name)
          ),
          array(
            'referrer'        => 'technorati.com',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/technorati_icon.png',
            'icon_link'       => 'http://technorati.com/faves?add=[[escaped-permalink]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello fellow <strong>Technorati</strong> user! Don\'t forget to <a href="http://technorati.com/faves?add=[[escaped-permalink]]" rel="nofollow"><strong>favorite this blog</strong></a> if you like it!', $this->p->name)
          ),
          array(
            'referrer'        => 'twitter.com, t.co',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/twitter_icon.png',
            'icon_link'       => 'http://twitthis.com/twit?url=[[escaped-permalink]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello fellow <strong>Twitter</strong> user! Don\'t forget to <a href="http://twitthis.com/twit?url=[[escaped-permalink]]" rel="nofollow"><strong>Twit this post</strong></a> if you like it, or <a href="http://twitter.com/" rel="nofollow"><strong>follow me</strong></a> on Twitter if you find me interesting.', $this->p->name)
          ),
          array(
            'referrer'        => 'search.yahoo.com',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/yahoo_icon.png',
            'icon_link'       => '[[rss-link]]',
            'show_till_close' => 1,
            'timeout'         => 1440,
            'text'            => __('Welcome fellow <strong>Yahooligan</strong>! If you find this page useful, you might want to <a href="[[rss-link]]" rel="nofollow"><strong>subscribe to the RSS feed</strong></a> for updates on this topic.', $this->p->name)
          ),
          array(
            'referrer'        => 'search.live.com, search.msn.com',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/live_icon.png',
            'icon_link'       => '[[rss-link]]',
            'show_till_close' => 1,
            'timeout'         => 1440,
            'text'            => __('Hello there <strong>Live</strong>-ly searcher! If you find this page useful, you might want to <a href="[[rss-link]]" rel="nofollow"><strong>subscribe to the RSS feed</strong></a> for updates on this topic.', $this->p->name)
          ),
          array(
            'referrer'        => 'blinklist.com',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/blinklist_icon.png',
            'icon_link'       => 'http://blinklist.com/blink?u=[[escaped-permalink]]&t=[[title]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there fellow <strong>Blinklist</strong> user! Feel free to <strong><a href="http://blinklist.com/blink?u=[[escaped-permalink]]&t=[[title]]" rel="nofollow">bookmark this page</a></strong> for future reference if you like it!', $this->p->name)
          ),
          array(
            'referrer'        => 'blogmarks.net',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/blogmarks_icon.png',
            'icon_link'       => 'http://blogmarks.net/my/new.php?mini=1&url=[[escaped-permalink]]&title=[[title]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there <stong>Blogmarks</strong> user! Feel free to <a href="http://blogmarks.net/my/new.php?mini=1&url=[[escaped-permalink]]&title=[[title]]" rel="nofollow"><strong>bookmark this page</strong></a> for future reference if you like it!', $this->p->name)
          ),
          array(
            'referrer'        => 'diigo.com',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/diigo_icon.png',
            'icon_link'       => 'http://secure.diigo.com/post?url=[[escaped-permalink]]&title=[[title]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there <strong>Diigo</strong> user! Feel free to <a href="http://secure.diigo.com/post?url=[[escaped-permalink]]&title=[[title]]" rel="nofollow"><strong>bookmark this page</strong></a> for future reference if you like it!', $this->p->name)
          ),
          array(
            'referrer'        => 'facebook.com',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/facebook_icon.png',
            'icon_link'       => 'http://www.facebook.com/share.php?u=[[escaped-permalink]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there <strong>Facebook</strong> friend! If you like this article, please help spread the word by <a href="http://www.facebook.com/share.php?u=[[escaped-permalink]]" rel="nofollow"><strong>sharing this post</strong></a> with your friends.', $this->p->name)
          ),
          array(
            'referrer'        => 'furl.net',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/furl_icon.png',
            'icon_link'       => 'http://www.furl.net/items/new?r=&v=1&c=&u=[[escaped-permalink]]&t=[[escaped-title]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there <strong>Furl</strong> user! Please feel free to <a href="http://www.furl.net/items/new?r=&v=1&c=&u=[[escaped-permalink]]&t=[[escaped-title]]" rel="nofollow"><strong>bookmark this page</strong></a> for future reference if you like it.', $this->p->name)
          ),
          array(
            'referrer'        => 'ma.gnolia.com',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/magnolia_icon.png',
            'icon_link'       => 'http://ma.gnolia.com/bookmarklet/add?url=[[escaped-permalink]]&title=[[title]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there <strong>Magnolia</strong> user! Please feel free to <a href="http://ma.gnolia.com/bookmarklet/add?url=[[escaped-permalink]]&title=[[title]]" rel="nofollow"><strong>bookmark this page</strong></a> for future reference if you like it.', $this->p->name)
          ),
          array(
            'referrer'        => 'mister-wong.com',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/mrwong_icon.png',
            'icon_link'       => 'http://www.mister-wong.com/index.php?action=addurl&bm_url=[[escaped-permalink]]&bm_description=[[title]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there <strong>Mister Wong</strong> user! Please feel free to <a href="http://www.mister-wong.com/index.php?action=addurl&bm_url=[[escaped-permalink]]&bm_description=[[title]]" rel="nofollow"><strong>bookmark this page</strong></a> for future reference if you like it.', $this->p->name)
          ),
          array(
            'referrer'        => 'myspace.com',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/myspace_icon.png',
            'icon_link'       => 'http://www.myspace.com/Modules/PostTo/Pages/?l=3&u=[[escaped-permalink]]&t=[[title]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there friend of <strong>MySpace</strong>! If you like this article, please help spread the word by <a href="http://www.myspace.com/Modules/PostTo/Pages/?l=3&u=[[escaped-permalink]]&t=[[title]]" rel="nofollow"><strong>sharing this post</strong></a> with your friends.', $this->p->name)
          ),
          array(
            'referrer'        => 'newsvine.com',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/newsvine_icon.png',
            'icon_link'       => 'http://www.newsvine.com/_tools/seed?popoff=0&u=[[escaped-permalink]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there <strong>Newsvine</strong> user! If you find this article useful, please remember to <a href="http://www.newsvine.com/_tools/seed?popoff=0&u=[[escaped-permalink]]" rel="nofollow"><strong>vote for this article</strong></a> on Newsvine.', $this->p->name)
          ),
          array(
            'referrer'        => 'reddit.com',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/reddit_icon.png',
            'icon_link'       => 'http://www.reddit.com/submit?url=[[escaped-permalink]]&title=[[title]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there fellow <strong>Reddit</strong> user! If you like this article, please remember to <a href="http://www.reddit.com/submit?url=[[escaped-permalink]]&title=[[title]]" rel="nofollow"><strong>vote for this article</strong></a> on Reddit.', $this->p->name)
          ),
          array(
            'referrer'        => 'simpy.com',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/simpy_icon.png',
            'icon_link'       => 'http://www.simpy.com/simpy/LinkAdd.do?href=[[escaped-permalink]]&title=[[title]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there <strong>Simpy</strong> user! Please feel free to <a href="http://www.simpy.com/simpy/LinkAdd.do?href=[[escaped-permalink]]&title=[[title]]" rel="nofollow"><strong>bookmark this page</strong></a> for future reference if you like it.', $this->p->name)
          ),
          array(
            'referrer'        => 'example.com',
            'disable'         => 1,
            'icon'            => $this->p->c->get_plugin_url().'images/favorite_icon.png',
            'icon_link'       => '[[rss-link]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there! If you are new here, you might want to <a href="[[rss-link]]" rel="nofollow"><strong>subscribe to the RSS feed</strong></a> for updates on this topic.', $this->p->name)
          ),
          array(
            'referrer'        => 'netvibes.com',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/netvibes_icon.png',
            'icon_link'       => '[[rss-link]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there <strong>Netvibes</strong> user! If you find this article useful, then you should consider <a href="[[rss-link]]" rel="nofollow"><strong>subscribing to the RSS feed</strong></a> in your feed reader.', $this->p->name)
          ),
          array(
            'referrer'        => 'youtube.com',
            'disable'         => 1,
            'icon'            => $this->p->c->get_plugin_url().'images/youtube_icon.png',
            'icon_link'       => '[[rss-link]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there <strong>YouTuber</strong>! If you like my videos, feel free to <a href="[[rss-link]]" rel="nofollow"><strong>subscribe to my RSS feed</strong></a> for more of my video updates.', $this->p->name)
          ),
          array(
            'referrer'        => 'flickr.com',
            'disable'         => 1,
            'icon'            => $this->p->c->get_plugin_url().'images/flickr_icon.png',
            'icon_link'       => '[[rss-link]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there <strong>Flickr</strong> user! If you like my photo, you might want to <a href="[[rss-link]]" rel="nofollow"><strong>subscribe to my RSS feed</strong></a> to receive regular photo updates.', $this->p->name)
          ),
          array(
            'referrer'        => 'wordpress.org',
            'disable'         => 1,
            'icon'            => $this->p->c->get_plugin_url().'images/wordpress_icon2.png',
            'icon_link'       => '[[rss-link]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there <strong>WordPress</strong> lover! If you are new here, you might want to <a href="[[rss-link]]" rel="nofollow"><strong>subscribe to my RSS feed</strong></a> to receive regular WordPress updates.', $this->p->name)
          ),
          array(
            'referrer'        => 'tumblr.com',
            'disable'         => 1,
            'icon'            => $this->p->c->get_plugin_url().'images/tumblr_icon.png',
            'icon_link'       => '[[rss-link]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there <strong>Tumblr</strong> user! If you are new here, you might want to <a href="[[rss-link]]" rel="nofollow"><strong>subscribe to my RSS feed</strong></a> to receive regular updates.', $this->p->name)
          ),
          array(
            'referrer'        => 'friendfeed.com',
            'disable'         => 1,
            'icon'            => $this->p->c->get_plugin_url().'images/friendfeed_icon.png',
            'icon_link'       => '[[rss-link]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there <strong>FriendFeed</strong> user! If you are new here, you might want to <a href="[[rss-link]]" rel="nofollow"><strong>subscribe to my RSS feed</strong></a>. Also, feel free to <a href="http://friendfeed.com" rel="nofollow"><strong>follow me</strong></a> on FriendFeed.', $this->p->name)
          ),
          array(
            'referrer'        => 'plurk.com',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/plurk_icon.png',
            'icon_link'       => '[[rss-link]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there fellow <strong>Plurker</strong>! If you are new here, you might want to <a href="[[rss-link]]" rel="nofollow"><strong>subscribe to my RSS feed</strong></a>. Also, feel free to <a href="http://plurk.com" rel="nofollow"><strong>follow me</strong></a> on Plurk.', $this->p->name)
          ),
          array(
            'referrer'        => 'linkedin.com',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/linkedin_icon.png',
            'icon_link'       => '[[rss-link]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there <strong>LinkedIn</strong> user! If you are new here, you might want to <a href="[[rss-link]]" rel="nofollow"><strong>subscribe to my RSS feed</strong></a> for more updates on this topic or read more about me on the <a href="/about" rel="nofollow"><strong>about page</strong></a>.', $this->p->name)
          ),
          array(
            'referrer'        => 'bing.com',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/bing_icon.png',
            'icon_link'       => '[[rss-link]]',
            'show_till_close' => 1,
            'timeout'         => 1440,
            'text'            => __('Hello there <strong>Bing</strong> decision maker! If you find this page interesting, you might want to <a href="[[rss-link]]" rel="nofollow"><strong>subscribe to the RSS feed</strong></a> for updates on this topic.', $this->p->name)
          ),
          array(
            'referrer'        => 'wikio.com',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/wikio_icon.png',
            'icon_link'       => '[[rss-link]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there <strong>Wikio</strong> user! If you find this article useful, then you should consider <a href="[[rss-link]]" rel="nofollow"><strong>subscribing to the RSS feed</strong></a> in your feed reader.', $this->p->name)
          ),
          array(
            'referrer'        => 'scoopeo.com',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/scoopeo_icon.png',
            'icon_link'       => '[[rss-link]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there <strong>Scoopeo</strong> user! If you find this article useful, then you should consider <a href="[[rss-link]]" rel="nofollow"><strong>subscribing to the RSS feed</strong></a> in your feed reader.', $this->p->name)
          ),
          array(
            'referrer'        => 'designrfix.com',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/designrfix_icon.png',
            'icon_link'       => '[[rss-link]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there <strong>Designrfix</strong> reader! If you find this article useful, then you should consider <a href="[[rss-link]]" rel="nofollow"><strong>subscribing to the RSS feed</strong></a> in your feed reader.', $this->p->name)
          ),
          array(
            'referrer'        => 'webdesign-ne.ws',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/webdesignnews_icon.png',
            'icon_link'       => '[[rss-link]]',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there <strong>Web Design News</strong> reader! If you find this article useful, then you should consider <a href="[[rss-link]]" rel="nofollow"><strong>subscribing to the RSS feed</strong></a> in your feed reader.', $this->p->name)
          ),
          array(
            'referrer'        => 'dzone.com',
            'disable'         => 0,
            'icon'            => $this->p->c->get_plugin_url().'images/dzone_icon.png',
            'icon_link'       => '',
            'show_till_close' => 0,
            'timeout'         => 0,
            'text'            => __('Hello there <strong>DZone</strong> user! If you think this is a fresh link, then you should consider <a href="http://www.dzone.com/links/add.html?noDupe=true&description=&url=[[escaped-permalink]]&title=[[title]]" rel="nofollow"><strong>voting up this post</strong></a> on DZone.', $this->p->name)
          )
        )
      );
    }

    function activate() {
      global $wpdb;

      $wpdb->hide_errors();
      $wpdb->query('ALTER TABLE '.$wpdb->posts.' ENGINE = MYISAM;');
      $wpdb->query('ALTER TABLE '.$wpdb->posts.' ADD FULLTEXT '.$this->p->name.'_post_related (post_title, post_content);');
      $wpdb->show_errors();

      $this->p->c->a_check_version();

      if (!class_exists('WPGreetBoxExt')) {
        // maybe the extension isn't activated so try to activate it
        $this->activate_ext();
      }
    }
  
    function activate_ext() {
      $plugin_path = 'wp-greet-box-ext/wp-greet-box-ext.php';
      if (file_exists($plugin_path)) {
        $current = get_option('active_plugins');
        if (!in_array($plugin_path, $current)) {
          $current[] = $plugin_path;
          update_option('active_plugins', $current);
          do_action('activate_'.$plugin_path);
        }
      }
    }

    function register_scripts() {
      wp_register_script($this->p->name.'_jquery_livequery',
        $this->p->c->get_plugin_url().'js/jquery.livequery.js', array('jquery'));
    }

    function enqueue_scripts() {
      wp_enqueue_script($this->p->name.'_jquery_livequery');
    }

    function register_styles() {
      $this->p->c->a_register_styles();
    }

    function enqueue_styles() {
      $this->p->c->a_enqueue_styles();
    }

    function embed_scripts() {
      // embed admin_onload.js with nonces for security reasons
      require_once('admin/onload.php');
    }
  
    function display_default_row($type, $wrap=true) {
      require('admin/custom-default-row.php');
    }
  
    function display_message_row($id, $wrap=true) {
      require('admin/custom-message-row.php');
    }
  
    function ajax_update_custom($id, $wpgb_message) {
      // convert "on" to 1 and "off" to 0 for checkbox fields
      // and set defaults for fields that are left blank
      if ($wpgb_message['disable'] == 'off')
        $wpgb_message['disable'] = 0;
      elseif ($wpgb_message['disable'] == 'on')
        $wpgb_message['disable'] = 1;

      if ($wpgb_message['show_till_close'] == 'off')
        $wpgb_message['show_till_close'] = 0;
      elseif ($wpgb_message['show_till_close'] == 'on')
        $wpgb_message['show_till_close'] = 1;

      if (!$wpgb_message['timeout'])
        $wpgb_message['timeout'] = 0;
  
      // Update options
      $this->p->o['messages'][$id] = $wpgb_message;
      update_option($this->p->name, $this->p->o);
    }
  
    function ajax_update_default($type, $wpgb_message) {
      // convert "on" to 1 and "off" to 0 for checkbox fields
      // and set defaults for fields that are left blank
      if ($wpgb_message['disable'] == 'off')
        $wpgb_message['disable'] = 0;
      elseif ($wpgb_message['disable'] == 'on')
        $wpgb_message['disable'] = 1;

      if ($wpgb_message['show_till_close'] == 'off')
        $wpgb_message['show_till_close'] = 0;
      elseif ($wpgb_message['show_till_close'] == 'on')
        $wpgb_message['show_till_close'] = 1;

      if (!$wpgb_message['timeout'])
        $wpgb_message['timeout'] = 0;
  
      // Update options
      $this->p->o['message_'.$type] = $wpgb_message;
      update_option($this->p->name, $this->p->o);
    }
  
    function update_options_exclusion() {
      $wpgb_options_exclusion = stripslashes_deep($_POST['wpgb_options_exclusion']);
  
      // convert "on" to 1 and "off" to 0 for checkbox fields
      // and set defaults for fields that are left blank
      if (isset($wpgb_options_exclusion['regex_rules']))
        $wpgb_options_exclusion['regex_rules'] = 1;
      else
        $wpgb_options_exclusion['regex_rules'] = 0;

      // Update options
      foreach ($wpgb_options_exclusion as $key => $value) {
        $this->p->o[$key] = $value;
      }
      update_option($this->p->name, $this->p->o);
      add_action('admin_notices', array($this->p->c, 'a_notify_updated'));
    }
  
    function update_options_general() {
      $wpgb_options_general = stripslashes_deep($_POST['wpgb_options_general']);
  
      // convert "on" to 1 and "off" to 0 for checkbox fields
      // and set defaults for fields that are left blank
      if ( isset($wpgb_options_general['corners']) )
        $wpgb_options_general['corners'] = 1;
      else
        $wpgb_options_general['corners'] = 0;
      if ( isset($wpgb_options_general['drop_shadow']) )
        $wpgb_options_general['drop_shadow'] = 1;
      else
        $wpgb_options_general['drop_shadow'] = 0;
      if ( isset($wpgb_options_general['show_page']) )
        $wpgb_options_general['show_page'] = 1;
      else
        $wpgb_options_general['show_page'] = 0;
      if ( isset($wpgb_options_general['show_post']) )
        $wpgb_options_general['show_post'] = 1;
      else
        $wpgb_options_general['show_post'] = 0;
      if ( isset($wpgb_options_general['show_home']) )
        $wpgb_options_general['show_home'] = 1;
      else
        $wpgb_options_general['show_home'] = 0;
      if ( isset($wpgb_options_general['regex_rules']) )
        $wpgb_options_general['regex_rules'] = 1;
      else
        $wpgb_options_general['regex_rules'] = 0;
      if ( isset($wpgb_options_general['target_blank']) )
        $wpgb_options_general['target_blank'] = 1;
      else
        $wpgb_options_general['target_blank'] = 0;
      if ( isset($wpgb_options_general['can_close']) )
        $wpgb_options_general['can_close'] = 1;
      else
        $wpgb_options_general['can_close'] = 0;
      if ( isset($wpgb_options_general['show_link']) && $wpgb_options_general['show_link'] == 'off' )
        $wpgb_options_general['show_link'] = 0;
      else
        $wpgb_options_general['show_link'] = 1;
      if ( isset($wpgb_options_general['show_related']) )
        $wpgb_options_general['show_related'] = 1;
      else
        $wpgb_options_general['show_related'] = 0;
      if ( isset($wpgb_options_general['show_related_excerpt']) )
        $wpgb_options_general['show_related_excerpt'] = 1;
      else
        $wpgb_options_general['show_related_excerpt'] = 0;
      if ( isset($wpgb_options_general['open_related']) )
        $wpgb_options_general['open_related'] = 1;
      else
        $wpgb_options_general['open_related'] = 0;
      if ( isset($wpgb_options_general['enable_css']) )
        $wpgb_options_general['enable_css'] = 1;
      else
        $wpgb_options_general['enable_css'] = 0;
      if ( isset($wpgb_options_general['enable_js']) )
        $wpgb_options_general['enable_js'] = 1;
      else
        $wpgb_options_general['enable_js'] = 0;
      if ( isset($wpgb_options_general['cache_compatible']) )
        $wpgb_options_general['cache_compatible'] = 1;
      else
        $wpgb_options_general['cache_compatible'] = 0;
      if ( isset($wpgb_options_general['show_logged_in']) )
        $wpgb_options_general['show_logged_in'] = 1;
      else
        $wpgb_options_general['show_logged_in'] = 0;
      if ( isset($wpgb_options_general['debug']) )
        $wpgb_options_general['debug'] = 1;
      else
        $wpgb_options_general['debug'] = 0;
      if ( !isset($wpgb_options_general['related_limit']) || $wpgb_options_general['related_limit'] == '' || !is_numeric($wpgb_options_general['related_limit']))
        $wpgb_options_general['related_limit'] = 5;
      if ( !isset($wpgb_options_general['related_excerpt_len']) || $wpgb_options_general['related_excerpt_len'] == '' || !is_numeric($wpgb_options_general['related_excerpt_len']))
        $wpgb_options_general['related_excerpt_len'] = 20;
  
      // set defaults if some fields that are left blank
      if ( !$wpgb_options_general['rss_link'] )
        $wpgb_options_general['rss_link'] = get_bloginfo('rss_url');
  
      // Update options
      foreach($wpgb_options_general as $key => $value) {
        $this->p->o[$key] = $value;
      }
      update_option($this->p->name, $this->p->o);
      add_action('admin_notices', array($this->p->c, 'a_notify_updated'));
    }
  
    function ajax_add($wpgb_message) {
      // convert "on" to 1 and "off" to 0 for checkbox fields
      // and set defaults for fields that are left blank
      if ($wpgb_message['disable'] == 'off')
        $wpgb_message['disable'] = 0;
      elseif ($wpgb_message['disable'] == 'on')
        $wpgb_message['disable'] = 1;
      if (!$wpgb_message['timeout'])
        $wpgb_message['timeout'] = 0;
  
      // Add to options
      $this->p->o['messages'][] = $wpgb_message;
      update_option($this->p->name, $this->p->o);
      return sizeof($this->p->o['messages']) - 1;
    }
  
    function ajax_delete($id) {
      // delete item but can't reindex yet
      unset($this->p->o['messages'][$id]);
  
      // Update options
      update_option($this->p->name, $this->p->o );
      return sizeof($this->p->o['messages']) - 1;
    }
  
    function upgrade_options() {
      if (!$this->p->o) {
        $this->p->o = $this->default_options();
        update_option($this->p->name, $this->p->o);
      }
      else {
        $default_options = $this->default_options();
  
        // upgrade regular options
        foreach($default_options as $option_name => $option_value) {
          if(!isset($this->p->o[$option_name])) {
            $this->p->o[$option_name] = $option_value;
          }
        }
  
        // upgrade default message options
        foreach($default_options['message_default'] as $key => $val) {
          if(!array_key_exists($key, $this->p->o['message_default'])) {
            // add new option if it's missing
            $this->p->o['message_default'][$key] = $val;
          }
        }
  
        // upgrade noscript message options
        foreach($default_options['message_noscript'] as $key => $val) {
          if(!array_key_exists($key, $this->p->o['message_noscript'])) {
            // add new option if it's missing
            $this->p->o['message_noscript'][$key] = $val;
          }
        }
  
        // upgrade message options
        $new_messages = $this->p->o['messages'];
        // for each default message
        foreach($default_options['messages'] as $def_message) {
          $found = false;
          // for each current message
          foreach($this->p->o['messages'] as $message_idx => $message) {
            if($message['referrer'] == $def_message['referrer']) {
              // found a matching message so check for any new message options
              foreach($def_message as $def_message_key => $def_message_val) {
                if(!array_key_exists($def_message_key, $message)) {
                  // add new message option if it's missing
                  $new_messages[$message_idx][$def_message_key] = $def_message_val;
                }
              }
              $found = true;
              break;
            }
          }
          if(!$found) {
            // did not find matching message, so add the default
            $new_messages[] = $def_message;
          }
        }
        $this->p->o['messages'] = $new_messages;
        $this->p->o['version'] = $this->p->version;
        update_option($this->p->name, $this->p->o);
      }
    }
  
    function ajax_request_handler() {
      check_ajax_referer($this->p->name);
      if (isset($_POST['wpgb_action'])) {
        if (isset($_POST['wpgb_id'])) {
          if (strtolower($_POST['wpgb_action']) == 'activate') {
            $this->ajax_activate($_POST['wpgb_id']);
          } elseif (strtolower($_POST['wpgb_action']) == 'deactivate') {
            $this->ajax_deactivate($_POST['wpgb_id']);
          } elseif (strtolower($_POST['wpgb_action']) == 'delete') {
            $this->ajax_delete($_POST['wpgb_id']);
          } elseif (strtolower($_POST['wpgb_action']) == 'get_add_form') {
            $this->ajax_get_add_form($_POST['wpgb_id']);
          } elseif (strtolower($_POST['wpgb_action']) == 'get_edit_form') {
            if(is_numeric($_POST['wpgb_id'])){
              $this->ajax_get_edit_form($_POST['wpgb_id']);
            } else {
              $this->ajax_get_edit_form_default($_POST['wpgb_id']);
            }
          }
          elseif (strtolower($_POST['wpgb_action']) == 'update') {
            if(is_numeric($_POST['wpgb_id'])){
              $this->ajax_update_custom($_POST['wpgb_id'], stripslashes_deep($_POST['wpgb_message']));
              $this->display_message_row($_POST['wpgb_id'], false);
            } else {
              $this->ajax_update_default($_POST['wpgb_id'], stripslashes_deep($_POST['wpgb_message']));
              $this->display_default_row($_POST['wpgb_id'], false);
            }
          }
          else {
            echo 'Invalid wpgb_action.';
          }
        } else {
          if (strtolower($_POST['wpgb_action']) == 'add') {
            $id = $this->ajax_add(stripslashes_deep($_POST['wpgb_message']));
            $this->display_message_row($id, true);
          } elseif (strtolower($_POST['wpgb_action']) == 'show_advanced_options') {
            $this->ajax_enable_advanced_options(true);
          } elseif (strtolower($_POST['wpgb_action']) == 'hide_advanced_options') {
            $this->ajax_enable_advanced_options(false);
          } else {
            echo 'Invalid wpgb_action.';
          }
        }
        exit();
      }
    }
  
    function request_handler() {
      if (isset($_POST['wpgb_options_general_submit'])) {
        check_admin_referer($this->p->name);
        $this->update_options_general();
      } elseif (isset($_POST['wpgb_options_exclusion_submit'])) {
        check_admin_referer($this->p->name);
        $this->update_options_exclusion();
      } elseif (isset($_POST['wpgb_options_upgrade'])) {
        check_admin_referer($this->p->name);
        $this->upgrade_options();
      } elseif (isset($_POST['wpgb_options_reset'])) {
        check_admin_referer($this->p->name);
        $this->p->c->a_reset_options();
        $this->p->o = get_option($this->p->name);
      } elseif (isset($_POST['wpgb_options_import'])) {
        check_admin_referer($this->p->name);
        $this->p->c->a_import_options('wpgb_options_import_file');
        $this->p->o = get_option($this->p->name);
      } elseif (isset($_POST['wpgb_options_export'])) {
        $this->p->c->a_export_options($this->p->name_dashed.'-options');
      }
    }
  
    function ajax_activate($id) {
      if($id == 'default') {
        $this->p->o['message_default']['disable'] = 0;
      } elseif($id == 'noscript') {
        $this->p->o['message_noscript']['disable'] = 0;
      } else {
        $this->p->o['messages'][$id]['disable'] = 0;
      }
      update_option($this->p->name, $this->p->o );
    }
  
    function ajax_deactivate($id) {
      if($id == 'default') {
        $this->p->o['message_default']['disable'] = 1;
      } elseif($id == 'noscript') {
        $this->p->o['message_noscript']['disable'] = 1;
      } else {
        $this->p->o['messages'][$id]['disable'] = 1;
      }
      update_option($this->p->name, $this->p->o );
    }
  
    function ajax_get_add_form($status) {
      require('admin/custom-add-form.php');
    }
  
    function ajax_get_edit_form($id) {
      require('admin/custom-edit-form.php');
    }
  
    function ajax_get_edit_form_default($type) {
      require('admin/custom-edit-form-default.php');
    }
  
    function ajax_enable_advanced_options($enable) {
      if ($enable == true){
        $this->p->o['show_advanced_options'] = 1;
      } else {
        $this->p->o['show_advanced_options'] = 0;
      }
      update_option($this->p->name, $this->p->o);
    }
  
    function menu() {
      $options_page = add_options_page($this->p->name_proper, $this->p->name_proper, 'manage_options', $this->p->name, array($this, 'page'));
      // only load these scripts on this plugin's options page
      add_action('admin_head-'.$options_page, array($this, 'embed_scripts'));
      add_action('admin_print_scripts-'.$options_page, array($this, 'enqueue_scripts'));
      add_action('admin_print_styles-'.$options_page, array($this, 'enqueue_styles'));
      // only check on settings pages
      add_action('admin_head-'.$options_page, array($this->p->c, 'a_check_orphan_options'));
    }

    function page() {
      // reindex here when we get the chance to reload page
      $this->p->o['messages'] = array_values($this->p->o['messages']);
      update_option($this->p->name, $this->p->o );

      require_once('admin/header.php');

      if(isset($_GET['wpgb-page'])) {
        if($_GET['wpgb-page'] == 'exclude') {
          require_once('admin/exclude.php');
        }
        elseif($_GET['wpgb-page'] == 'generic') {
          require_once('admin/generic.php');
        }
        elseif($_GET['wpgb-page'] == 'import-export') {
          require_once('admin/import-export.php');
        }
      }
      else {
        require_once('admin/custom.php');
      }

      require_once('admin/sidebar.php');
      require_once('admin/footer.php');
    } // function page()

    function post_options() {
      require('admin/post-options.php');
    }

    function store_post_options($post_id) {
      if (!isset($_POST['wpgb_hide']) || empty($_POST['wpgb_hide'])) {
        delete_post_meta($post_id, 'wpgb_hide');
        return;
      }
      $post = get_post($post_id);
      if (!$post || $post->post_type == 'revision') {
        return;
      }
      update_post_meta($post_id, 'wpgb_hide', true);
    }

  } // class WPGreetBoxAdmin

} // if !class_exists
?>
