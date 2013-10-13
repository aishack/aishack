<?php
if (!class_exists('WPGreetBox')) {

  class WPGreetBox {

    // settings
    var $homepage = 'http://omninoggin.com/wordpress-plugins/wp-greet-box-wordpress-plugin/';
    var $name = 'wp_greet_box';
    var $name_dashed = 'wp-greet-box';
    var $name_proper = 'WP Greet Box';
    var $version = '6.4.0';
    var $required_wp_version = '2.7';

    // variables
    var $visit_delta = null;
    var $is_excerpt = false;
    var $o = null; // options

    // objects
    var $a = null; // admin
    var $c = null; // common
    var $ext = null; //extensions

    function WPGreetBox() {
      // initialize options
      $this->o = get_option($this->name);

      // initialize common functions
      require_once(dirname(__FILE__).'/common.class.php');
      $this->c = new WPGreetBoxCommon($this);

      // load translation
      $this->c->load_text_domain();

      // load extensions if it exists
      if ($this->ext_exists()) {
        $this->ext = new WPGreetBoxExt($this);
      }

      // create admin object
      require_once(dirname(__FILE__).'/admin.class.php');
      $this->a = new WPGreetBoxAdmin($this);

      // if no options then don't do anything in public
      if ($this->o) {
        // queue up other hooks after all plugins are loaded (per dependencies if any)
        add_action('plugins_loaded', array($this, 'execute'));
      }
    }

    function execute() {
      global $wpgb_shown;
      $wpgb_shown = false;

      // public hooks
      add_action('send_headers', array($this, 'set_user_visit_delta'));
      add_action('init', array($this, 'public_request_handler'));
      add_action('clear_auth_cookie', array($this, 'clear_logged_in_cookie'));
      add_action('set_auth_cookie', array($this, 'set_logged_in_cookie'));
      add_action('get_the_excerpt', array($this, 'mark_excerpt'), 1); // set priority to 1 or else it'll run after the post handler
      add_filter('the_content', array($this, 'filter_content'), 100);

      if ($this->o['enable_css']) {
        add_action('init', array($this, 'register_styles'));
        add_action('wp_print_styles', array($this, 'enqueue_styles'));
      }
      if ($this->o['enable_js']) {
        add_action('init', array($this, 'register_scripts'));
        add_action('wp_print_scripts', array($this, 'enqueue_scripts'));
      }
    }
  
    function ext_exists() {
      if (!class_exists('WPGreetBoxExt'))
        return false;
      else
        return true;
    }

    function register_styles() {
      wp_register_style($this->name.'_style',
        $this->c->get_plugin_url().'css/style.css');
    }

    function enqueue_styles() {
      wp_enqueue_style($this->name.'_style');
    }

    function register_scripts() {
      wp_register_script($this->name.'_functions',
        $this->c->get_plugin_url().'js/functions.js');

      if ($this->o['cache_compatible']) {
        wp_register_script($this->name.'_js_mode',
          $this->c->get_plugin_url().'js/js-mode.js', array('jquery'));
      }
      else {
        wp_register_script($this->name.'_php_mode',
          $this->c->get_plugin_url().'js/php-mode.js', array('jquery'));
      }
    }

    function enqueue_scripts() {
      wp_enqueue_script($this->name.'_functions');
      wp_enqueue_script('jquery');

      if ($this->o['cache_compatible']) {
        wp_enqueue_script($this->name.'_js_mode');
      }
      else {
        wp_enqueue_script($this->name.'_php_mode');
      }
    }

    function set_logged_in_cookie() {
	setcookie('wpgb_logged_in', 'true', time()+60*60*24*365);
    }

    function clear_logged_in_cookie() {
	setcookie('wpgb_logged_in', '', time()-60*60*24*365);
    }
  
    function mark_excerpt($excerpt) {
      $this->is_excerpt = true;
      return $excerpt;
    }

    function get_icon_html($icon_file, $icon_link) {
      if ($this->o['target_blank'])
        $target = 'target="_blank"';
      else
        $target = '';

      if ( $icon_link != '' )
        return '<a href="'.$icon_link.'" '.$target.' rel="nofollow"><img src="'.$icon_file.'" alt="WP Greet Box icon"/></a>';
      else
        return '<img src="'.$icon_file.'" alt="WP Greet Box icon"/>';
    }

    function get_message_html($message, $close) {
      $html = '';
      if ( strlen ( $message['icon'] ) > 0 ) {
        // do not show icon if there is no icon url
        $html .= $this->o['before_icon'].$this->get_icon_html($message['icon'], $message['icon_link']).$this->o['after_icon'];
      }
      if($close && $this->o['can_close']) {
        $html .= '<div class="greet_block_close"><a id="greet_block_close" href="#">X</a></div>';
      }
      $html .= $message['text'];

      return $html;
    }

    function get_related_html($http_referrer) {
      $html = '';
      if($this->o['show_related'] && $this->get_ref_info('isref', $http_referrer)) {
        $related_list = $this->get_ref_related($http_referrer, $this->o['related_limit'], '<li><strong>', '</strong><br/>', '', '...</li>', false, $this->o['show_related_excerpt'], $this->o['related_excerpt_len']);
        if ( $related_list ) {
          if($this->o['open_related']) {
            $shown_style = 'style="display:none"';
            $hidden_style = '';
          }
          else {
            $shown_style = '';
            $hidden_style = 'style="display:none"';
          }
          $html .= '<div style="clear:both"></div><div id="greet_search" class="greet_search_'.$this->o['related_position'].'">';
          $html .= '<span id="greet_search_text_show" '.$shown_style.'>'.__('You were searching for', $this->name).'</span>';
          $html .= '<span id="greet_search_text_hide" '.$hidden_style.'>'.__('Posts relating to', $this->name).'</span> ';
          $html .= '"<u>'.$this->get_ref_info('terms', $http_referrer).'</u>". <a id="greet_search_link" action="show">';
          $html .= '<span id="greet_search_link_text_show" '.$shown_style.'>'.__('See posts relating to your search', $this->name).' &#187;</span>';
          $html .= '<span id="greet_search_link_text_hide" '.$hidden_style.'>&#171; '.__('Hide related posts', $this->name).'</span></a>';
          $html .= '<div id="greet_search_results" '.$hidden_style.'><ul>'.$related_list.'</ul></div></div>';
        }
      }

      return $html;
    }

    function add_classes($tag, $classes) {
      $classes = implode(' ', $classes);
      return preg_replace( '/class=([\'"])([^\'"]*?)([\'"])/', "class=$1$2 $classes$3", $tag);
    }

    function add_extra_styles($tag) {
      $classes = array();
      if($this->o['corners'])
        $classes[] = 'wpgb_cornered';
      if($this->o['drop_shadow'])
        $classes[] = 'wpgb_shadowed';
      if(count($classes) > 0)
        return $this->add_classes($tag, $classes);
      else
        return $tag;
    }

    function get_greet_html($message, $http_referrer='', $page_url='', $page_title='', $close=true, $filter=true) {
      $html = $this->add_extra_styles($this->o['before_greet']).$this->o['before_text'];

      if($this->o['related_position'] == 'before') {
        $html .= $this->get_related_html($http_referrer);
        $html .= $this->get_message_html($message, $close);
      }
      else {
        $html .= $this->get_message_html($message, $close);
        $html .= $this->get_related_html($http_referrer);
      }

      if($this->o['show_link']) {
        $html .= '<div style="clear:both"></div><div class="greet_block_powered_by">'.sprintf(__('Powered by %sWP Greet Box%s %sWordPress Plugin%s', $this->name), '<a href="http://omninoggin.com/projects/wordpress-plugins/wp-greet-box-wordpress-plugin/" title="WP Greet Box WordPress Plugin" style="text-decoration:none;">', '</a>', '<a href="http://omninoggin.com/" title="WordPress Plugin" style="text-decoration:none;">', '</a>').'</div>'; 
      }
      $html .= $this->o['after_text'].$this->o['after_greet'];
  
      // use default title and URL if none is passed
      if($page_url == '')
        $permalink_r = $this->c->get_current_page_url();
      else
        $permalink_r = $page_url;
      if($page_title == '')
        $title_r = wp_title('', false);
      else
        $title_r = $page_title;
  
      // replace tags
      $html = str_replace('[[rss-link]]', $this->o['rss_link'], $html);
      $html = str_replace('[[email-link]]', $this->o['email_link'], $html);
      $html = str_replace('[[permalink]]', $permalink_r, $html);
      $html = str_replace('[[escaped-permalink]]', rawurlencode($permalink_r), $html);
      $html = str_replace('[[title]]', $title_r, $html);
      $html = str_replace('[[escaped-title]]', rawurlencode($title_r), $html);
      if ( $filter ) {
        $html = apply_filters('greet_box_text', $html);
      }
      return $html;
    }
  
    function is_excluded($referrer) {
      if (!isset($this->o['exclude_referrer']) || !strlen($this->o['exclude_referrer'])) { return false; }
  
      # take care of Windows EOL characters
      $rules = str_replace(chr(13), '', $this->o['exclude_referrer']);
      $rules = split(chr(10), $rules);
      foreach ($rules as $rule) {
        # ignore empty rules
        if (strlen($rule) > 0) {
          if($this->o['regex_rules']) {
            $rule = str_replace('/', '\\/', $rule);
            if(preg_match('/'.$rule.'/', $referrer)) { return true; }
          } else {
            if (strlen($rule) > 0 && stristr($referrer, $rule)) { return true; }
          }
        }
      }
  
      return false;
    }
  
    function find_greet_html($http_referrer, $visit_delta, $closed=false, $logged_in=false, $page_url, $page_title) {
      if($this->o['debug'] || $this->o['show_logged_in'] || !$logged_in) {
        $referrer_domain = $this->get_ref_domain($http_referrer, false);
  
        if(!$this->is_excluded($http_referrer)) {
          // if not one of the excluded URLs
          if(strlen(trim($referrer_domain)) > 0){
            // if referrer is defined and is a regular URL
            foreach($this->o['messages'] as $message){
              if(
                !$message['disable']
                &&
                strlen(trim($message['referrer'])) > 0
                &&
                strlen(trim($message['text'])) > 0
                && (
                  ($this->o['debug'])
                  ||
                  ($message['show_till_close'] && !$closed)
                  ||
                  (!$message['show_till_close'] && ($visit_delta < 0 || $visit_delta >= $message['timeout']))
                )
              ){
                // prepare regex for matching
                $referrer_regex = str_replace(' ', '', $message['referrer']);
                $referrer_regex = str_replace('.', '\\.', $referrer_regex);
                $referrer_regex = str_replace('/', '\\/', $referrer_regex);
                $referrer_regex = str_replace(',', '|', $referrer_regex);
                $referrer_regex = str_replace('*', '.*', $referrer_regex);
                $referrer_regex = '/'.$referrer_regex.'/';
  
                // compare regex
                if(preg_match($referrer_regex, $http_referrer))
                  return $this->get_greet_html($message, $http_referrer, $page_url, $page_title, true);
              }
            }
          }
  
          // if referrer not defined or no custom greeting messages match, display default
          if(
            !$this->o['message_default']['disable']
            &&
            strlen(trim($this->o['message_default']['text'])) > 0
            && (
              ($this->o['debug'])
              ||
              ($this->o['message_default']['show_till_close'] && !$closed)
              ||
              (!$this->o['message_default']['show_till_close'] && ($visit_delta < 0 || $visit_delta >= $this->o['message_default']['timeout']))
            )
          )
            return $this->get_greet_html($this->o['message_default'], $http_referrer, $page_url, $page_title, true);
        }
      }

      return '';
    }
  
    function get_ref_delim($http_referrer) {
      $ref = $this->get_ref_domain($http_referrer);
      // Search engine match array
      // Used for fast delimiter lookup for single host search engines.
      // Non .com Google/MSN/Yahoo referrals are checked for after this array is checked
      $search_engines = array(
        'google.fr' => 'q',
        'google.com' => 'q',
        'search.yahoo.com' => 'p',
        'fr.search.yahoo.com' => 'p',
        'search.msn.com' => 'q',
        'search.live.com' => 'q',
        'rechercher.aliceadsl.fr' => 'qs',
        'vachercher.lycos.fr' => 'query',
        'search.lycos.com' => 'query',
        'alltheweb.com' => 'q',
        'search.aol.com' => 'query',
        'search.ke.voila.fr' => 'rdata',
        'recherche.club-internet.fr' => 'q',
        'ask.com' => 'q',
        'hotbot.com' => 'query',
        'overture.com' => 'Keywords',
        'search.netscape.com' => 'query',
        'search.looksmart.com' => 'qt',
        'search.earthlink.net' => 'q',
        'search.viewpoint.com' => 'k',
        'mamma.com' => 'query'
      );
    
      $delim = false;
    
      // Check to see if we have a host match in our lookup array
      if (isset($search_engines[$ref])) {
        $delim = $search_engines[$ref];
      }
      else {
      // Lets check for referrals for international TLDs and sites with strange formats    
        if (strpos($ref, 'google.') !== false && strpos($ref, 'reader') === false)
          $delim = 'q';
        elseif (strpos($ref, 'search.msn.') !== false)
          $delim = 'q';
        elseif (strpos($ref, '.search.yahoo.') !== false)
          $delim = 'q';
        elseif (strpos($ref, 'exalead.') !== false)
          $delim = 'q';
        elseif (strpos($ref, 'search.aol.') !== false)
          $delim = 'query';
        elseif (strpos($ref, '.ask.com') !== false)
          $delim = 'q';
        elseif (strpos($ref, 'recherche.aol.fr') !== false)
          $delim = (strpos($http_referrer, 'query')!==false)?'query':'q';
      }
    
      return $delim;
    }
    
    function get_ref_terms($http_referrer) {
      $terms       = null;
      $delimiter   = $this->get_ref_delim($http_referrer);
      if($delimiter) {
        $query_array = array();
        $query_terms = null;
    
        // Get raw query
        $query = explode($delimiter.'=', $http_referrer);
        $query = explode('&', $query[1]);
        $query = urldecode($query[0]);
    
        // Remove quotes, split into words, and format for HTML display
        $query = str_replace("'", '', $query);
        $query = str_replace('"', '', $query);
        $query_array = preg_split('/[\s,\+\.]+/',$query);
        $query_terms = implode(' ', $query_array);
        $terms = htmlspecialchars(urldecode($query_terms));
      }
    
      return $terms;
    }
    
    function get_ref_domain($http_referrer, $strip_www=true) {
      // Break out quickly so we don't waste CPU cycles on non referrals
      if (!isset($http_referrer) || ($http_referrer == '')) return false;
    
      $referer_info = parse_url($http_referrer);
      $referer = $referer_info['host'];
    
      if($strip_www && substr($referer, 0, 4) == 'www.') {
        // Remove www. if necessary
        $referer = substr($referer, 4);
      }
    
      return $referer;
    }
    
    function get_ref_related($http_referrer, $limit=5, $before_title='', $after_title='', $before_post='', $after_post='', $show_pass_post=false, $show_excerpt=false, $excerpt_len=20) {
      global $wpdb, $id;
    
      // Is this a supported search engine?
      if (!$this->get_ref_domain($http_referrer)) return false;
    
      $terms = $wpdb->escape($this->get_ref_terms($http_referrer));
    
      if ($terms) { 
        $time_difference = get_option('gmt_offset');
        $now = gmdate("Y-m-d H:i:s", (time()+($time_difference*3600)));
    
        // Primary SQL query
      
        $sql = 'SELECT ID, post_title, post_content,'
            . "MATCH (post_title, post_content) AGAINST ('".$terms."') AS score "
            . 'FROM '.$wpdb->posts.' WHERE '
            . "MATCH (post_title, post_content) AGAINST ('".$terms."') "
            . "AND post_date <= '".$now."' "
            . "AND (post_status IN ( 'publish',  'static' )) "
            . "AND post_type = 'post' ";
        if ($show_pass_post == false) {
          $sql .= "AND post_password = '' ";
        }
        $sql .= "ORDER BY score DESC LIMIT $limit";
        $results = $wpdb->get_results($sql);
        $output = '';
    
        if ($results) {
          foreach ($results as $result) {
            $title = stripslashes(apply_filters('the_title', $result->post_title));
            $permalink = get_permalink($result->ID);
            $post_content = strip_tags($result->post_content);
            $post_content = preg_replace( '|\[(.+?)\](.+?\[/\\1\])?|s', '', $post_content);
            $post_content = stripslashes($post_content);
            $output .= $before_title . '<a href="'. $permalink .'" rel="bookmark" title="'.__('Permanent Link to:', $this->p->name) . $title . '">' . $title . '</a>' . $after_title;
            if ($show_excerpt) {
              $words=split(" ",$post_content); 
              $post_strip = join(" ", array_slice($words,0,$excerpt_len));
              $output .= $before_post . $post_strip . $after_post;
            }
          }
          return $output;
        } else {
          return False;
        }
      }
    }
    
    // Return true if the referer is a search engine
    function get_ref_info($what, $http_referrer) {
      // Is this a supported search engine?
      if (!$this->get_ref_domain($http_referrer)) return false;
      $terms = $this->get_ref_terms($http_referrer);
    
      if($terms) {
        if ($what == 'isref') { 
          return ($terms != ''?true:false);
        }
        if ($what == 'terms') {
          return $terms;
        }
      }
    } 
  
    function set_user_visit_delta() {
      # we have to set the cookie prior to the page rendering to avoid error messages (so this function is in send_headers hook)
      $full_ref = trim($_SERVER["HTTP_REFERER"]);
      $ref = 'default';
      if ( strlen($full_ref) > 0 && preg_match('/^http:\/\/[^\/]+/i', $full_ref, $matches) ) {
        $ref = str_replace('.', '_', $matches[0]);
      }

      # if cookie doesn't exist, then create it
      $url = parse_url(get_option('home'));
  
      if ( array_key_exists('wpgb_visit_last_php-'.$ref, $_COOKIE) ) {
        # if cookie already exsts then get the visit delta
        $visit_last = (int)$_COOKIE['wpgb_visit_last_php-'.$ref];
        setcookie('wpgb_visit_last_php-'.$ref, time(), time() + 60 * 60 * 24 * 365, trailingslashit($url['path']));
        $this->visit_delta = (int)round((time() - $visit_last)/60);
      }
      else {
        setcookie('wpgb_visit_last_php-'.$ref, time(), time() + 60 * 60 * 24 * 365, trailingslashit($url['path']));
        $this->visit_delta = -1;
      }
    }
  
    function get_user_closed($full_ref) {
      $ref = 'default';
      if ( strlen($full_ref) > 0 && preg_match('/^http:\/\/[^\/]+/i', $full_ref, $matches) ) {
        $ref = str_replace('.', '_', $matches[0]);
      }

      if ( array_key_exists('wpgb_closed-'.$ref, $_COOKIE) ) {
        # if cookie already exsts
        return true;
      }
      else {
        return false;
      }
    }
  
    function get_html() {
      $html = '<div id="greet_block">';

      if ( !$this->o['cache_compatible'] ) {
        // get message right away
        $full_ref = trim($_SERVER["HTTP_REFERER"]);
        $closed = $this->get_user_closed($full_ref);
        $html .= $this->find_greet_html($full_ref, $this->visit_delta, $closed, is_user_logged_in(), get_permalink(), get_the_title());
      }
      elseif ( !$this->o['message_noscript']['disable'] ) {
        $html .= '<noscript>';
        $html .= $this->get_greet_html($this->o['message_noscript'], '', '', '', false, false);
        $html .= '</noscript>';
      }
      $html .= '</div>';

      return $html;
    }

    function has_greet_message() {
      $full_ref = trim($_SERVER["HTTP_REFERER"]);
      if ( $full_ref != "" ) {
        $closed = $this->get_user_closed($full_ref);
        $html = $this->find_greet_html($full_ref, $this->visit_delta, $closed, is_user_logged_in(), get_permalink(), get_the_title());
        if ( $html != "" ) {
          return true;
        }
      }
      return false;
    }
  
    function display() {
      global $wpgb_shown;
      if(is_feed() || ($this->o['show_page'] && is_page()) || ($this->o['show_post'] && is_single())){
        return;
      }
      else{
        $wpgb_shown = true;
        echo $this->get_html();
      }
    }
  
    function filter_content($content) {
      if (!$this->is_excerpt) {
        // don't filter if this is an excerpt
        global $wpgb_shown, $wp_query;
        $post = $wp_query->posts[0];
        $wpgb_hide = get_post_meta($post->ID, 'wpgb_hide', true);
        if ( empty($wpgb_hide) ) {
          if ( (is_page() && $this->o['show_page'])
            || (is_single() && $this->o['show_post'])
            || ((is_home() || is_front_page()) && $this->o['show_home']) ) {
            if ((is_home() || is_front_page()) && $wpgb_shown) return $content;
            $wpgb_shown = true;
            if($this->o['position'] == 'after') {
              return $content . $this->get_html();
            }
            else {
              return $this->get_html() . $content;
            }
          }
        }
      }
      $this->is_excerpt = false;
      return $content;
    }
  
    function public_request_handler() {
      if(isset($_GET['wpgb_public_action'])){
        if ( strtolower($_GET['wpgb_public_action']) == 'query' ) {
          echo $this->find_greet_html(urldecode($_GET['referrer']),$_GET['visit_delta'],$_GET['closed'],$_GET['logged_in'],urldecode($_GET['url']),urldecode($_GET['title']));
        }
        exit();
      }
    }

  } // class WPGreetBox

} // if !class_exists
?>
