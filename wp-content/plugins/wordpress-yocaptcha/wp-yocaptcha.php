<?php
/*
Plugin Name: WP-yocaptcha
Plugin URI: http://www.innovese.com/yocaptcha/user/
Description: Integrates yocaptcha anti-spam solutions with wordpress
Version: 1.0
Author: Neeraj Agarwal
Email: info@innovese.com
Author URI: http://www.innovese.com
*/

// Plugin was initially created by Ben Maurer and Mike Crawford

// WORDPRESS TYPE DETECTION

// WordPress MU settings - DON'T EDIT
//    0 - Regular WordPress installation
//    1 - WordPress MU Forced Activated
//    2 - WordPress MU Optional Activation
//	  3 - WordPress MS Network Activated

$wpmu = 0;

if (basename(dirname(__FILE__)) == "mu-plugins") // forced activated
   $wpmu = 1;
else if (basename(dirname(__FILE__)) == "plugins" && function_exists('is_site_admin')) // optionally activated
   $wpmu = 2;

if (function_exists('is_multisite'))
	if (is_multisite())
		$wpmu = 3;

if ($wpmu == 1 || $wpmu == 3)
   $yocaptcha_opt = get_site_option('yocaptcha'); // get the options from the database
else
   $yocaptcha_opt = get_option('yocaptcha'); // get the options from the database

// END WORDPRESS TYPE DETECTION

if ($wpmu == 1)
   require_once(dirname(__FILE__) . '/wp-yocaptcha/yocaptchalib.php');
else
   require_once(dirname(__FILE__) . '/yocaptchalib.php');

// doesn't need to be secret, just shouldn't be used by any other code.
define ("YOCAPTCHA_WP_HASH_SALT", "b7e0638d85f5d7f3694f68e94413662l");

/* =============================================================================
   CSS - This links the pages to the stylesheet to be properly styled
   ============================================================================= */

function yo_css() {
   global $yocaptcha_opt, $wpmu;

   if (!defined('WP_CONTENT_URL'))
      define('WP_CONTENT_URL', get_option('siteurl') . '/wp-content');

   $path = WP_CONTENT_URL . '/plugins/wp-yocaptcha/yocaptcha.css';

   if ($wpmu == 1)
		$path = WP_CONTENT_URL . '/mu-plugins/wp-yocaptcha/yocaptcha.css';

//   echo '<link rel="stylesheet" type="text/css" href="' . $path . '" />';
}

function registration_css() {
   global $yocaptcha_opt;

   if ($yocaptcha_opt['yo_registration']) {
		$width = 0;

		if ($yocaptcha_opt['yo_theme_reg'] == 'red' ||
          $yocaptcha_opt['yo_theme_reg'] == 'white' ||
          $yocaptcha_opt['yo_theme_reg'] == 'blackglass')
          $width = 358;
		else if ($yocaptcha_opt['yo_theme_reg'] == 'clean')
          $width = 485;
/*
		echo <<<REGISTRATION
		<style type="text/css">
		#login {
				width: {$width}px !important;
		}

		#login a {
				text-align: center;
		}

		#nav {
				text-align: center;
		}
		form .submit {
            margin-top: 10px;
      }
		</style>
REGISTRATION;
*/
   }
}

//add_action('wp_head', 'yo_css'); // include the stylesheet in typical pages to style hidden emails
//add_action('admin_head', 'yo_css'); // include stylesheet to style options page
//add_action('login_head', 'registration_css'); // include the login div styling, embedded

/* =============================================================================
   End CSS
   ============================================================================= */

// If the plugin is deactivated, delete the preferences
function delete_preferences() {
   global $wpmu;

   if ($wpmu != 1)
		delete_option('yocaptcha');
}

register_deactivation_hook(__FILE__, 'delete_preferences');

/* =============================================================================
   yoCAPTCHA on Registration Form - Thanks to Ben C.'s recapture plugin
   ============================================================================= */

// Display the yoCAPTCHA on the registration form
function display_yocaptcha($errors) {
	global $yocaptcha_opt, $wpmu;

   if ($yocaptcha_opt['yo_registration']) {
		$format = <<<END
		<script type='text/javascript'>
		var YocaptchaOptions = { theme : '{$yocaptcha_opt['yo_theme_reg']}', lang : '{$yocaptcha_opt['yo_lang']}' , tabindex : 30 };
		</script>
END;

		$comment_string = <<<COMMENT_FORM
		<script type='text/javascript'>
		document.getElementById('yocaptcha_table').style.direction = 'ltr';
		</script>
COMMENT_FORM;

		if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == "on")
         $use_ssl = true;
		else
         $use_ssl = false;

		if ($wpmu == 1) {
   		$error = $errors->get_error_message('captcha'); ?>
   		<label for="verification">Verification:</label>
         <?php echo($error ? '<p class="error">'.$error.'</p>' : '') ?>
         <?php echo $format . yocaptcha_wp_get_html($_REQUEST['rerror'], $use_ssl, $yocaptcha_opt['yo_theme']); ?>
   		<?php }

		else {
         echo '<hr style="clear: both; margin-bottom: 1.5em; border: 0; border-top: 1px solid #999; height: 1px;" />';
         echo $format . yocaptcha_wp_get_html($_REQUEST['rerror'], $use_ssl, $yocaptcha_opt['yo_theme']);
      }
   }
}

// Hook the display_yocaptcha function into WordPress
if ($wpmu != 1 && $wpmu != 3)
   add_action('register_form', 'display_yocaptcha');
else
   add_action('signup_extra_fields', 'display_yocaptcha');

// Check the captcha
function check_yocaptcha() {
	global $yocaptcha_opt, $errors;

   if (empty($_REQUEST['yocaptcha_answer']))
		$errors['blank_captcha'] = $yocaptcha_opt['error_blank'];

   else {
   	$response = verify_form($yocaptcha_opt['privkey'],
		$_REQUEST['yocaptcha_session'],
		$_REQUEST['yocaptcha_answer']);

   	if (!$response->is_valid)
   		if ($response->error == 'incorrect-answer')
   				$errors['captcha_wrong'] = $yocaptcha_opt['error_incorrect'];
   }
}

// Check the captcha
function check_yocaptcha_new($errors) {
	global $yocaptcha_opt;

   if (empty($_REQUEST['yocaptcha_answer']) || $_REQUEST['yocaptcha_answer'] == '') {
		$errors->add('blank_captcha', $yocaptcha_opt['error_blank']);
		return $errors;
   }

	$response = verify_form($yocaptcha_opt['privkey'],
      $_REQUEST['yocaptcha_session'],
      $_REQUEST['yocaptcha_answer'] );

	if (!$response->is_valid)
		if ($response->error == 'incorrect-answer')
			$errors->add('captcha_wrong', $yocaptcha_opt['error_incorrect']);

   return $errors;
}

// Check the yocaptcha on WordPress MU
function check_yocaptcha_wpmu($result) {
   global $_REQUEST, $yocaptcha_opt;

   // must make a check here, otherwise the wp-admin/user-new.php script will keep trying to call
   // this function despite not having called do_action('signup_extra_fields'), so the yocaptcha
   // field was never shown. this way it won't validate if it's called in the admin interface
   if (!is_admin()) {
         // It's blogname in 2.6, blog_id prior to that
      if (isset($_REQUEST['blog_id']) || isset($_REQUEST['blogname']))
      	return $result;

      // no text entered
      if (empty($_REQUEST['yocaptcha_answer']) || $_REQUEST['yocaptcha_answer'] == '') {
      	$result['errors']->add('blank_captcha', $yocaptcha_opt['error_blank']);
      	return $result;
      }

      $response = verify_form($yocaptcha_opt['privkey'],
         $_REQUEST['yocaptcha_session'],
         $_REQUEST['yocaptcha_answer'] );

      // incorrect CAPTCHA
      if (!$response->is_valid)
      	if ($response->error == 'incorrect-answer') {
      		$result['errors']->add('captcha_wrong', $yocaptcha_opt['error_incorrect']);
            echo "<div class=\"error\">". $yocaptcha_opt['error_incorrect'] . "</div>";
      	}
   }

   return $result;
}

if ($yocaptcha_opt['yo_registration']) {
   if ($wpmu == 1 || $wpmu == 3)
		add_filter('wpmu_validate_user_signup', 'check_yocaptcha_wpmu');

   else if ($wpmu == 0) {
		// Hook the check_yocaptcha function into WordPress
		if (version_compare(get_bloginfo('version'), '2.5' ) >= 0)
         add_filter('registration_errors', 'check_yocaptcha_new');
		else
         add_filter('registration_errors', 'check_yocaptcha');
   }
}
/* =============================================================================
   End yocaptcha on Registration Form
   ============================================================================= */

/* =============================================================================
   yocaptcha Plugin Default Options
   ============================================================================= */

$option_defaults = array (
   'pubkey'	=> '', // the public key for yocaptcha
   'privkey'	=> '', // the private key for yocaptcha
    'yo_bypass' => '', // whether to sometimes skip yocaptchas for registered users
   'yo_bypasslevel' => '', // who doesn't have to do the yocaptcha (should be a valid WordPress capability slug)
    'yo_theme' => '', // the default theme for yocaptcha on the comment post
   'yo_theme_reg' => '', // the default theme for yocaptcha on the registration form
   'yo_lang' => 'en', // the default language for yocaptcha
   'yo_tabindex' => '5', // the default tabindex for yocaptcha
   'yo_comments' => '1', // whether or not to show yocaptcha on the comment post
   'yo_registration' => '1', // whether or not to show yocaptcha on the registratoin page
   'yo_xhtml' => '0', // whether or not to be XHTML 1.0 Strict compliant
   'mh_replace_link' => '', // name the link something else
   'mh_replace_title' => '', // title of the link
   'error_blank' => '<strong>ERROR</strong>: Please fill in the yoCAPTCHA form.', // the message to display when the user enters no CAPTCHA response
   'error_incorrect' => '<strong>ERROR</strong>: That yoCAPTCHA response was incorrect.', // the message to display when the user enters the incorrect CAPTCHA response
);

// install the defaults
if ($wpmu != 1)
   add_option('yocaptcha', $option_defaults, 'yoCAPTCHA Default Options', 'yes');

/* =============================================================================
   End yocaptcha Plugin Default Options
   ============================================================================= */



/* =============================================================================
   yocaptcha - The yocaptcha comment spam protection section
   ============================================================================= */
function yocaptcha_wp_hash_comment($id)
{
	global $yocaptcha_opt;

	if (function_exists('wp_hash'))
		return wp_hash(yocaptcha_WP_HASH_COMMENT . $id);
	else
		return md5(yocaptcha_WP_HASH_COMMENT . $yocaptcha_opt['privkey'] . $id);
}

function yocaptcha_wp_get_html ($yocaptcha_error, $use_ssl=false, $col) {
	global $yocaptcha_opt;

	return get_html($yocaptcha_opt['pubkey'],"", $col);
}

/**
 *  Embeds the yocaptcha widget into the comment form.
 *
 */
function yocaptcha_comment_form() {
   global $user_ID, $yocaptcha_opt;

   // set the minimum capability needed to skip the captcha if there is one
   if ($yocaptcha_opt['yo_bypass'] && $yocaptcha_opt['yo_bypasslevel'])
      $needed_capability = $yocaptcha_opt['yo_bypasslevel'];

	// skip the yocaptcha display if the minimum capability is met
	if (($needed_capability && current_user_can($needed_capability)) || !$yocaptcha_opt['yo_comments'])
		return;

   else {
		// Did the user fail to match the CAPTCHA? If so, let them know
		if ($_REQUEST['rerror'] == 'incorrect-answer')
		echo "<p class=\"yocaptcha-error\">" . $yocaptcha_opt['error_incorrect'] . "</p>";

		//modify the comment form for the yocaptcha widget
		$yocaptcha_js_opts = <<<OPTS
		<script type='text/javascript'>
				var yocaptchaOptions = { theme : '{$yocaptcha_opt['yo_theme']}', lang : '{$yocaptcha_opt['yo_lang']}' , tabindex : {$yocaptcha_opt['yo_tabindex']} };
		</script>
OPTS;

		if ($yocaptcha_opt['yo_xhtml']) {
		$comment_string = <<<COMMENT_FORM
				<div id="yocaptcha-submit-btn-area"><br /></div>
				<script type='text/javascript'>
				var sub = document.getElementById('submit');
				sub.parentNode.removeChild(sub);
				document.getElementById('yocaptcha-submit-btn-area').appendChild (sub);
				document.getElementById('submit').tabIndex = 6;
				if ( typeof _yocaptcha_wordpress_savedcomment != 'undefined') {
						document.getElementById('comment').value = _yocaptcha_wordpress_savedcomment;
				}
				document.getElementById('yocaptcha_table').style.direction = 'ltr';
				</script>
COMMENT_FORM;
		}

		else {
		$comment_string = <<<COMMENT_FORM
				<div id="yocaptcha-submit-btn-area"></div>
				<script type='text/javascript'>
				var sub = document.getElementById('submit');
				sub.parentNode.removeChild(sub);
				document.getElementById('yocaptcha-submit-btn-area').appendChild (sub);
				document.getElementById('submit').tabIndex = 6;
				if ( typeof _yocaptcha_wordpress_savedcomment != 'undefined') {
						document.getElementById('comment').value = _yocaptcha_wordpress_savedcomment;
				}
				document.getElementById('yocaptcha_table').style.direction = 'ltr';
				</script>
				<noscript>
				 <style type='text/css'>#submit {display:none;}</style>
				 <input name="submit" type="submit" id="submit-alt" tabindex="6" value="Submit Comment"/>
				</noscript>
COMMENT_FORM;
		}

		if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == "on")
         $use_ssl = true;
		else
         $use_ssl = false;

		echo $yocaptcha_js_opts .  yocaptcha_wp_get_html($_REQUEST['rerror'], $use_ssl, $yocaptcha_opt['yo_theme']) . $comment_string;
   }
}

add_action('comment_form', 'yocaptcha_comment_form');

function yocaptcha_wp_show_captcha_for_comment() {
   global $user_ID;
   return true;
}

$yocaptcha_saved_error = '';

/**
 * Checks if the yocaptcha guess was correct and sets an error session variable if not
 * @param array $comment_data
 * @return array $comment_data
 */
function yocaptcha_wp_check_comment($comment_data) {
	global $user_ID, $yocaptcha_opt;
	global $yocaptcha_saved_error;

   // set the minimum capability needed to skip the captcha if there is one
   if ($yocaptcha_opt['yo_bypass'] && $yocaptcha_opt['yo_bypasslevel'])
      $needed_capability = $yocaptcha_opt['yo_bypasslevel'];

	// skip the filtering if the minimum capability is met
	if (($needed_capability && current_user_can($needed_capability)) || !$yocaptcha_opt['yo_comments'])
		return $comment_data;

	if (yocaptcha_wp_show_captcha_for_comment()) {
		if ( $comment_data['comment_type'] == '' ) { // Do not check trackbacks/pingbacks
			$challenge = $_REQUEST['yocaptcha_challenge_field'];
			$response = $_REQUEST['yocaptcha_response_field'];

			$yocaptcha_response = verify_form ($yocaptcha_opt ['privkey'], $_REQUEST['yocaptcha_session'], $_REQUEST['yocaptcha_answer']);
			if ($yocaptcha_response->is_valid)
				return $comment_data;
			else {
				$yocaptcha_saved_error = $yocaptcha_response->error;
				add_filter('pyo_comment_approved', create_function('$a', 'return \'spam\';'));
				return $comment_data;
			}
		}
	}
	return $comment_data;
}

/*
 * If the yocaptcha guess was incorrect from yocaptcha_wp_check_comment, then redirect back to the comment form
 * @param string $location
 * @param OBJECT $comment
 * @return string $location
 */
function yocaptcha_wp_relative_redirect($location, $comment) {
	global $yocaptcha_saved_error;
	if($yocaptcha_saved_error != '') {
		//replace the '#comment-' chars on the end of $location with '#commentform'.

		$location = substr($location, 0,strrpos($location, '#')) .
			((strrpos($location, "?") === false) ? "?" : "&") .
			'rcommentid=' . $comment->comment_ID .
			'&rerror=' . $yocaptcha_saved_error .
			'&rchash=' . yocaptcha_wp_hash_comment ($comment->comment_ID) .
			'#commentform';
	}
	return $location;
}

/*
 * If the yocaptcha guess was incorrect from yocaptcha_wp_check_comment, then insert their saved comment text
 * back in the comment form.
 * @param boolean $approved
 * @return boolean $approved
 */
function yocaptcha_wp_saved_comment() {
   if (!is_single() && !is_page())
      return;

   if ($_REQUEST['rcommentid'] && $_REQUEST['rchash'] == yocaptcha_wp_hash_comment ($_REQUEST['rcommentid'])) {
      $comment = get_comment($_REQUEST['rcommentid']);

      $com = preg_replace('/([\\/\(\)\+\;\'\"])/e','\'%\'.dechex(ord(\'$1\'))', $comment->comment_content);
      $com = preg_replace('/\\r\\n/m', '\\\n', $com);

      echo "
      <script type='text/javascript'>
      var _yocaptcha_wordpress_savedcomment =  '" . $com  ."';

      _yocaptcha_wordpress_savedcomment = unescape(_yocaptcha_wordpress_savedcomment);
      </script>
      ";

      wp_delete_comment($comment->comment_ID);
   }
}

function yocaptcha_wp_blog_domain () {
	$uri = parse_url(get_settings('siteurl'));
	return $uri['host'];
}

add_filter('wp_head', 'yocaptcha_wp_saved_comment',0);
add_filter('preprocess_comment', 'yocaptcha_wp_check_comment',0);
add_filter('comment_post_redirect', 'yocaptcha_wp_relative_redirect',0,2);

function yocaptcha_wp_add_options_to_admin() {
   global $wpmu;

	if ($wpmu == 3 && is_super_admin()) {
		add_submenu_page('ms-admin.php', 'yocaptcha', 'yocaptcha', 'manage_options', __FILE__, 'yocaptcha_wp_options_subpanel');
		add_options_page('yocaptcha', 'yocaptcha', 'manage_options', __FILE__, 'yocaptcha_wp_options_subpanel');
	}
	else if ($wpmu == 1 && is_site_admin()) {
		add_submenu_page('wpmu-admin.php', 'yocaptcha', 'yocaptcha', 'manage_options', __FILE__, 'yocaptcha_wp_options_subpanel');
		add_options_page('yocaptcha', 'yocaptcha', 'manage_options', __FILE__, 'yocaptcha_wp_options_subpanel');
	}
	else if ($wpmu != 1) {
		add_options_page('yocaptcha', 'yocaptcha', 'manage_options', __FILE__, 'yocaptcha_wp_options_subpanel');
	}
}

function yocaptcha_wp_options_subpanel() {
   global $wpmu;
	// Default values for the options array
	$optionarray_def = array(
		'pubkey'	=> '',
		'privkey' 	=> '',

		'yo_bypasslevel' => '3',
		'mh_bypasslevel' => '3',
 		'yo_theme' => 'red',
		'yo_theme_reg' => 'red',
		'yo_lang' => 'en',
		'yo_tabindex' => '5',
		'yo_comments' => '1',
		'yo_registration' => '1',
		'yo_xhtml' => '0',
      'mh_replace_link' => '',
      'mh_replace_title' => '',
      'error_blank' => '<strong>ERROR</strong>: Please fill in the yocaptcha form.',
      'error_incorrect' => '<strong>ERROR</strong>: That yocaptcha response was incorrect.',
		);

	if ($wpmu != 1)
		add_option('yocaptcha', $optionarray_def, 'yocaptcha Options');

	/* Check form submission and update options if no error occurred */
	if (isset($_REQUEST['submit'])) {
		$optionarray_update = array (
		'pubkey'	=> trim($_REQUEST['yocaptcha_opt_pubkey']),
		'privkey'	=> trim($_REQUEST['yocaptcha_opt_privkey']),
	 	'yo_bypass' => $_REQUEST['yo_bypass'],
		'yo_bypasslevel' => $_REQUEST['yo_bypasslevel'],
	 	'mh_bypass' => $_REQUEST['mh_bypass'],
		'mh_bypasslevel' => $_REQUEST['mh_bypasslevel'],
		'yo_theme' => $_REQUEST['yo_theme'],
		'yo_theme_reg' => $_REQUEST['yo_theme_reg'],
		'yo_lang' => $_REQUEST['yo_lang'],
		'yo_tabindex' => $_REQUEST['yo_tabindex'],
		'yo_comments' => $_REQUEST['yo_comments'],
		'yo_registration' => $_REQUEST['yo_registration'],
		'yo_xhtml' => $_REQUEST['yo_xhtml'],
      'mh_replace_link' => $_REQUEST['mh_replace_link'],
      'mh_replace_title' => $_REQUEST['mh_replace_title'],
      'error_blank' => $_REQUEST['error_blank'],
      'error_incorrect' => $_REQUEST['error_incorrect'],
		);
	// save updated options
	if ($wpmu == 1 || $wpmu == 3)
		update_site_option('yocaptcha', $optionarray_update);
	else
		update_option('yocaptcha', $optionarray_update);
}

	/* Get options */
	if ($wpmu == 1 || $wpmu == 3)
		$optionarray_def = get_site_option('yocaptcha');
   else
		$optionarray_def = get_option('yocaptcha');

/* =============================================================================
   yocaptcha Admin Page and Functions
   ============================================================================= */

/*
 * Display an HTML <select> listing the capability options for disabling security
 * for registered users.
 * @param string $select_name slug to use in <select> id and name
 * @param string $checked_value selected value for dropdown, slug form.
 * @return NULL
 */

function yocaptcha_dropdown_capabilities($select_name, $checked_value="") {
	// define choices: Display text => permission slug
	$capability_choices = array (
	 	'All registered users' => 'read',
	 	'Edit posts' => 'edit_posts',
	 	'Publish Posts' => 'publish_posts',
	 	'Moderate Comments' => 'moderate_comments',
	 	'Administer site' => 'level_10'
	 	);
	// print the <select> and loop through <options>
	echo '<select name="' . $select_name . '" id="' . $select_name . '">' . "\n";
	foreach ($capability_choices as $text => $capability) :
		if ($capability == $checked_value) $checked = ' selected="selected" ';
		echo '\t <option value="' . $capability . '"' . $checked . ">$text</option> \n";
		$checked = NULL;
	endforeach;
	echo "</select> \n";
 } // end yocaptcha_dropdown_capabilities()

?>

<!-- ############################## BEGIN: ADMIN OPTIONS ################### -->
<div class="wrap">
	<h2>yocaptcha Options</h2>
	<h3>About yocaptcha</h3>
	<p>yocaptcha is a free, accessible CAPTCHA service that helps to digitize books while blocking spam on your blog.</p>

	<p>yocaptcha asks commenters to retype two words scanned from a book to prove that they are a human. This verifies that they are not a spambot while also correcting the automatic scans of old books. So you get less spam, and the world gets accurately digitized books. Everybody wins! For details, visit the <a href="http://yocaptcha.net/">yocaptcha website</a>.</p>
   <p><strong>NOTE</strong>: If you are using some form of Cache plugin you will probably need to flush/clear your cache for changes to take effect.</p>

	<form name="form1" method="post" action="<?php echo $_SERVER['REDIRECT_SCRIPT_URI'] . '?page=' . plugin_basename(__FILE__); ?>&updated=true">
		<div class="submit">
			<input type="submit" name="submit" value="<?php _e('Update Options') ?> &raquo;" />
		</div>

	<!-- ****************** Operands ****************** -->
   <table class="form-table">
   <tr valign="top">
		<th scope="row">yocaptcha Keys</th>
		<td>
			yocaptcha requires an API key, consisting of a "public" and a "private" key. You can sign up for a
			<br />
			<p class="re-keys">
				<!-- yocaptcha public key -->
				<label class="which-key" for="yocaptcha_opt_pubkey">Public Key:</label>
				<input name="yocaptcha_opt_pubkey" id="yocaptcha_opt_pubkey" size="40" value="<?php  echo $optionarray_def['pubkey']; ?>" />
				<br />
				<!-- yocaptcha private key -->
				<label class="which-key" for="yocaptcha_opt_privkey">Private Key:</label>
				<input name="yocaptcha_opt_privkey" id="yocaptcha_opt_privkey" size="40" value="<?php  echo $optionarray_def['privkey']; ?>" />
			</p>
	    </td>
    </tr>
  	<tr valign="top">
		<th scope="row">Comment Options</th>
		<td>
			<!-- Show yocaptcha on the comment post -->
			<big><input type="checkbox" name="yo_comments" id="yo_comments" value="1" <?php if($optionarray_def['yo_comments'] == true){echo 'checked="checked"';} ?> /> <label for="yo_comments">Enable yocaptcha for comments.</label></big>
			<br />
			<!-- Don't show yocaptcha to admins -->
			<div class="theme-select">
			<input type="checkbox" id="yo_bypass" name="yo_bypass" <?php if($optionarray_def['yo_bypass'] == true){echo 'checked="checked"';} ?>/>
			<label name="yo_bypass" for="yo_bypass">Hide yocaptcha for <strong>registered</strong> users who can:</label>
			<?php yocaptcha_dropdown_capabilities('yo_bypasslevel', $optionarray_def['yo_bypasslevel']); // <select> of capabilities ?>
			</div>

			<!-- The theme selection -->
			<div class="theme-select">
			<label for="yo_theme">Background Color (#XXXXXX) Just type XXXXXX part:</label>
			<input type="text" name="yo_theme" id="yo_theme" value="<? echo $optionarray_def['yo_theme']; ?>">

			</div>
			<!-- Tab Index -->
			<label for="yo_tabindex">Tab Index (<em>e.g. WP: <strong>5</strong>, WPMU: <strong>3</strong></em>):</label>
			<input name="yo_tabindex" id="yo_tabindex" size="5" value="<?php  echo $optionarray_def['yo_tabindex']; ?>" />
			<br />
			<?php global $wpmu; if ($wpmu == 1 || $wpmu == 0 || $wpmu == 3) { ?>
		</td>
	</tr>
	<tr valign="top">
		<th scope="row">Registration Options</th>
		<td>
			<!-- Show yocaptcha on the registration page -->
			<big><input type="checkbox" name="yo_registration" id="yo_registration" value="1" <?php if($optionarray_def['yo_registration'] == true){echo 'checked="checked"';} ?> /> <label for="yo_registration">Enable yocaptcha on registration form.</label></big>
			<br />
			<!-- The theme selection -->
			<div class="theme-select">
				<label for="yo_theme_reg">Background Color (#XXXXXX) Just type XXXXXX part:</label>
				<input type="text" name="yo_theme_reg" id='yo_theme_reg" value="<?php echo $optionarray_def['yo_theme_reg']; ?>">

			</div>
			<?php } ?>
		</td>
	</tr>
   <tr valign="top">
      <th scope="row">Error Messages</th>
         <td>
            <p>The following are the messages to display when the user does not enter a CAPTCHA response or enters the incorrect CAPTCHA response.</p>
            <!-- Error Messages -->
            <p class="re-keys">
               <!-- Blank -->
      			<label class="which-key" for="error_blank">No response entered:</label>
      			<input name="error_blank" id="error_blank" size="80" value="<?php echo $optionarray_def['error_blank']; ?>" />
      			<br />
      			<!-- Incorrect -->
      			<label class="which-key" for="error_incorrect">Incorrect response entered:</label>
      			<input name="error_incorrect" id="error_incorrect" size="80" value="<?php echo $optionarray_def['error_incorrect']; ?>" />
      		</p>
         </td>
      </th>
   </tr>
	 <tr valign="top">
			<th scope="row">General Settings</th>
			<td>
				<!-- The language selection -->
				<div class="lang-select">
				<label for="yo_lang">Language:</label>
				<select name="yo_lang" id="yo_lang">
				<option value="en" <?php if($optionarray_def['yo_lang'] == 'en'){echo 'selected="selected"';} ?>>English</option>
				<option value="nl" <?php if($optionarray_def['yo_lang'] == 'nl'){echo 'selected="selected"';} ?>>Dutch</option>
				<option value="fr" <?php if($optionarray_def['yo_lang'] == 'fr'){echo 'selected="selected"';} ?>>French</option>
				<option value="de" <?php if($optionarray_def['yo_lang'] == 'de'){echo 'selected="selected"';} ?>>German</option>
				<option value="pt" <?php if($optionarray_def['yo_lang'] == 'pt'){echo 'selected="selected"';} ?>>Portuguese</option>
				<option value="ru" <?php if($optionarray_def['yo_lang'] == 'ru'){echo 'selected="selected"';} ?>>Russian</option>
				<option value="es" <?php if($optionarray_def['yo_lang'] == 'es'){echo 'selected="selected"';} ?>>Spanish</option>
				<option value="tr" <?php if($optionarray_def['yo_lang'] == 'tr'){echo 'selected="selected"';} ?>>Turkish</option>
				</select>
				</label>
		    	</div>
		    	<!-- Whether or not to be XHTML 1.0 Strict compliant -->
				<input type="checkbox" name="yo_xhtml" id="yo_xhtml" value="1" <?php if($optionarray_def['yo_xhtml'] == true){echo 'checked="checked"';} ?> /> <label for="yo_xhtml">Be XHTML 1.0 Strict compliant. <strong>Note</strong>: Bad for users who don't have Javascript enabled in their browser (Majority do).</label>
				<br />
			</td>
		</tr>
	</table>

 	<div class="submit">
		<input type="submit" name="submit" value="<?php _e('Update Options') ?> &raquo;" />
	</div>

	</form>
   <p class="copyright">&copy; Copyright 2008&nbsp;&nbsp;<a href="http://yocaptcha.net">yocaptcha</a></p>
</div> <!-- [wrap] -->
<!-- ############################## END: ADMIN OPTIONS ##################### -->

<?php
}

/* =============================================================================
   Apply the admin menu
============================================================================= */

add_action('admin_menu', 'yocaptcha_wp_add_options_to_admin');

// If no yocaptcha API keys have been entered
if ( !($yocaptcha_opt ['pubkey'] && $yocaptcha_opt['privkey'] ) && !isset($_REQUEST['submit']) ) {
   function yocaptcha_warning() {
		global $wpmu;

		$path = plugin_basename(__FILE__);
		$top = 0;
		if ($wp_version <= 2.5)
		$top = 12.7;
		else
		$top = 7;
		echo "
		<div id='yocaptcha-warning' class='updated fade-ff0000'><p><strong>yocaptcha is not active</strong> You must <a href='options-general.php?page=" . $path . "'>enter your yocaptcha API key</a> for it to work</p></div>
		<style type='text/css'>
		#adminmenu { margin-bottom: 5em; }
		#yocaptcha-warning { position: absolute; top: {$top}em; }
		</style>
		";
   }

   if (($wpmu == 1 && is_site_admin()) || $wpmu != 1)
		add_action('admin_footer', 'yocaptcha_warning');

   return;
}
 // If the mcrypt PHP module isn't loaded then display an alert


/* =============================================================================
   End Apply the admin menu
============================================================================= */
?>
