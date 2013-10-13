<?php
/*
Plugin Name: MCEComments
Plugin URI: http://mk.netgenes.org/my-plugins/mcecomments/
Description: A simple hack to enable WYSIWYG editor TinyMCE on the comment field.
Version: 0.4.8
Author: mk
Author URI: http://mk.netgenes.org
*/

$mcecomment_nonce = 'mcecomment-update-key';
$mce_locale = ( '' == get_locale() ) ? 'en' : strtolower( substr(get_locale(), 0, 2) );

function mcecomment_adminpages() {
	$page = add_options_page('MCEComments Options', 'MCEComments', 8, 'tinyMCEComments', 'mcecomment_optionpage');
	add_action( "admin_print_scripts-$page", 'mcecomment_admin_page_init' );
}

//Get availabe skins for TinyMCE
function mcecomment_getskins() {
   $adv_path = ABSPATH . 'wp-includes/js/tinymce/themes/advanced/skins/';
   if ($h = opendir($adv_path)) {
		while (($file = readdir($h)) !== false) {
		   $skin_path = $adv_path . $file;
			if (is_dir($skin_path) && strpos($file, '.') !== 0) 
				$skins[] = $file;
			}
		closedir($h);
	}

	return $skins;
}

//Get available plugins of TinyMCE
function mcecomment_getplugins() {
	if ($h = opendir(ABSPATH . 'wp-includes/js/tinymce/plugins')) {
		while (($file = readdir($h)) !== false) {
			if (is_file(ABSPATH . 'wp-includes/js/tinymce/plugins/' . $file . '/editor_plugin.js')) 
				$plugins[] = $file;
			}
		closedir($h);
	}

	return $plugins;
}

function mcecomment_optionpage() {
	global $mcecomment_nonce, $wp_version;
	
	$mcecomment_options = get_option('mcecomment_options');
	
	if ( isset($_POST['submit']) ) {
		if ( function_exists('current_user_can') && !current_user_can('manage_options') )
			die(__('Cheatin&#8217; uh?'));

      if (!function_exists('settings_fields')) {
		   check_admin_referer($mcecomment_nonce);
      } else {
         check_admin_referer('mceComments-options');
      }
      
      if (isset($mcecomment_options['language']))
   		unset($mcecomment_options['language']);
			
		$mcecomment_options['rtl'] = (isset($_POST['mcecomment_rtl']) ? '1' : '0');
		$mcecomment_options['viewhtml'] = (isset($_POST['mcecomment_viewhtml']) ? '1' : '0');
		$mcecomment_options['resize'] = (isset($_POST['mcecomment_resize']) ? '1' : '0');
      $mcecomment_options['skin'] = (isset($_POST['mcecomment_skin']) ? $_POST['mcecomment_skin'] : 'default');
      
		if (isset($_POST['mcecomment_buttons'])) {
			$buttons = trim($_POST['mcecomment_buttons']);
			if ($buttons[strlen($buttons)-1] == ',') {
				$buttons = substr($buttons, 0, -1);
			}
			$mcecomment_options['buttons'] = $buttons;
		}

		if (isset($_POST['mcecomment_plugins'])) {
			$plugins = trim($_POST['mcecomment_plugins']);
			if ($plugins[strlen($plugins)-1] == ',') {
				$plugins = substr($plugins, 0, -1);
			}
			$mcecomment_options['plugins'] = $plugins;
		}

		if (isset($_POST['mcecomment_css']))
			$mcecomment_options['css'] = trim($_POST['mcecomment_css']);
	
		update_option('mcecomment_options', $mcecomment_options);
	}
	 
	mcecomment_init();
?>

<?php if ( !empty($_POST ) ) : 
?>
<div id="message" class="updated fade"><p><strong><?php _e('Options saved.') ?></strong></p></div>
<?php endif; ?>

<div class="wrap">
<h2>MCEComments Options</h2>

<form method="post">
<?php 
if ( !function_exists('settings_fields') ) {
   wp_nonce_field($action);
} else {
	settings_fields('mceComments');
}
?>
<h3>Interface</h3> 
<script type="text/javascript">
//<![CDATA[
function inserttext(obj_out,obj_in) {
	obj = document.getElementById(obj_out);
	obj.value += ((obj.value != '') ? ',' : '') + (obj_in).innerHTML;
}
//]]>
</script>
<table width="100%" cellspacing="2" cellpadding="5" class="form-table">
<tr class="form-field"> 
<th>Options:</th>
<td>
<p><input name="mcecomment_rtl" type="checkbox" id="mcecomment_rtl" value="1" <?php echo ($mcecomment_options['rtl'] ? 'checked="checked"':''); ?>/>
<label for="mcecomment_rtl">Enable right-to-left (RTL) editing mode in comment field</label></p>
<p><input name="mcecomment_viewhtml" type="checkbox" id="mcecomment_viewhtml" value="1" <?php echo ($mcecomment_options['viewhtml'] ? 'checked="checked"':''); ?>  />
<label for="mcecomment_viewhtml">Enable HTML source editing of the comment field</label></p>
<p><input name="mcecomment_resize" type="checkbox" id="mcecomment_resize" value="1" <?php echo ($mcecomment_options['resize'] ? 'checked="checked"':''); ?>  />
<label for="mcecomment_resize">Enable vertical resizing of the comment field writing area</label></p>
</td></tr>
<tr class="form-field"> 
<th>Skin:</th><td>
<p><select name="mcecomment_skin" id="mcecomment_skin">
   <?php
      $skins = mcecomment_getskins();
      for ($i=0; $i<count($skins); $i++) {
         if ($skins[$i] == $mcecomment_options['skin'])
            echo "<option value=\"$skins[$i]\" selected=\"selected\">$skins[$i]</option>";
         else
            echo "<option value=\"$skins[$i]\">$skins[$i]</option>";
      }
   ?>
 </select></p>
 </td></tr>
</table>

<h3>Advance Options</h3> 
<table width="100%" cellspacing="2" cellpadding="5" class="form-table"> 
<tr class="form-field">
<th>Buttons in use:</th>
<td><input name="mcecomment_buttons" type="text" id="mcecomment_buttons" value="<?php echo $mcecomment_options['buttons']; ?>" style="width:98%" /><br />
(separated with commas)<br /> 
Available buttons: 
<?php $pls = array('separator','bold','italic','underline','strikethrough','justifyleft','justifycenter','justifyright','justifyfull','bullist','numlist','outdent','indent','cut','copy','paste','undo','redo','link','unlink','cleanup','help','code','hr','removeformat','sub','sup','forecolor','backcolor','charmap','visualaid','blockquote','spellchecker','fullscreen');
for ($i=0; $i<count($pls); $i++) {
echo '<span style="cursor: pointer; text-decoration: underline;" onclick="inserttext(\'mcecomment_buttons\', this);">'.$pls[$i].'</span>  '; 
}?>
</td>
</tr><tr class="form-field"> 
<th>Plugins in use:</th>
<td><input name="mcecomment_plugins" type="text" id="mcecomment_plugins" value="<?php echo $mcecomment_options['plugins']; ?>" style="width:98%" /><br />
(separated with commas)<br /> 
Detected plugins: 
<?php $pls = mcecomment_getplugins(); 
for ($i=0; $i<count($pls); $i++) {
echo '<span style="cursor: pointer; text-decoration: underline;" onclick="inserttext(\'mcecomment_plugins\', this);">'.$pls[$i].'</span>  '; 
}?>
</td>
</tr><tr class="form-field">
<th>User defined CSS:</th>
<td><input name="mcecomment_css" type="text" id="mcecomment_css" value="<?php echo $mcecomment_options['css']; ?>" style="width:98%" /><br />
Fully qualified URL required (leave blank to use default CSS)
</td></tr>
</table>

<h3>Preview</h3> 
<table width="100%" cellspacing="2" cellpadding="5" class="form-table"> 
<tr valign="top" class="form-field"> 
<th>Preview:</th>
<td>Update options to preview how the comment textarea box will appear.<br /><textarea name="comment" id="comment" rows="5" tabindex="4" style="width:99%">This is a preview textarea</textarea>
</td></tr>
</table>

<p class="submit">
<?php if (!function_exists('settings_fields')) : ?>
   <input type="hidden" name="action" value="update" />
<?php endif; ?>
<input type="submit" name="submit" value="Update Options &raquo;" />
</p>
</form>
</div>
<?php
}

function mcecomment_getcss() {
	$mcecomment_options = get_option('mcecomment_options');
  
	if ($mcecomment_options['css'] != '') {
		return $mcecomment_options['css'];
   } elseif (mcecomment_isGreaterThan('2.8.0')) {
		return get_option('siteurl') . '/wp-includes/js/tinymce/themes/advanced/skins/wp_theme/content.css';
	} elseif (mcecomment_isGreaterThan('2.5.0')) {
		return get_option('siteurl') . '/wp-includes/js/tinymce/wordpress.css';
	} else {
		return get_option('siteurl') . '/wp-includes/js/tinymce/plugins/wordpress/wordpress.css';
	}
}

//Generate JS Block
function mcecomment_getInitJS($debugMode=0) {
   global $mce_locale;
   
	if ($debugMode == 1)
		$le = "\n";
	$mcecomment_options = get_option('mcecomment_options');
	
	if (!is_array($mcecomment_options)) {
		$mcecomment_options['buttons'] = 'bold,italic,underline,|,strikethrough,|,bullist,numlist,|,undo,redo,|,link,unlink,|,removeformat';
		update_option('mcecomment_options', $mcecomment_options);
	}
	$initArray = array (
	   'mode' => 'exact',
	   'elements' => 'comment',
	   'theme' => 'advanced',
	   'theme_advanced_buttons1' => $mcecomment_options['buttons'],
	   'theme_advanced_buttons2' => "",
	   'theme_advanced_buttons3' => "",
	   'theme_advanced_toolbar_location' => "top",
	   'theme_advanced_toolbar_align' => "left",
	   'theme_advanced_statusbar_location' => ($mcecomment_options['resize'] ? 'bottom' : 'none'),
	   'theme_advanced_resizing' => ($mcecomment_options['resize'] ? 'true' : 'false'),
	   'theme_advanced_resize_horizontal' => false,
	   'theme_advanced_disable' => ($mcecomment_options['viewhtml'] ? '':'code'),
	   'force_p_newlines' => false,
	   'force_br_newlines' => true,
	   'forced_root_block' => "p",
	   'gecko_spellcheck' => true,
 	   'skin' => ($mcecomment_options['skin'] ? $mcecomment_options['skin'] : 'default'),
	   'content_css' => mcecomment_getcss(),
	   'directionality' => ($mcecomment_options['rtl'] ? 'rtl' : 'ltr'),
	   'save_callback' => "brstonewline",
	   'entity_encoding' => "raw",
	   'plugins' => $mcecomment_options['plugins'],
	   //'extended_valid_elements' => "a[name|href|title],hr[class|width|size|noshade],font[face|size|color|style],span[class|align|style],blockquote[cite]",'.$le;
      'language' => $mce_locale,
   );
   
   $params = array();
	foreach ( $initArray as $k => $v )
		$params[] = $k . ':"' . $v . '"	';
	$res = join(',', $params);
	?>
	<script type="text/javascript">
      /* <![CDATA[ */
      function brstonewline(element_id, html, body) {
	      html = html.replace(/<br\s*\/>/gi, "\n");
	      return html;
	   }
	   
	   function insertHTML(html) {
	      tinyMCE.execCommand("mceInsertContent",false, html);
	   }
	   
      tinyMCEPreInit = {
	      base : "<?php echo get_option('siteurl') ?>/wp-includes/js/tinymce",
	      suffix : "",
	      query : "ver=20081129",
	      mceInit : {<?php echo $res ?>},

	      go : function() {
		      var t = this, sl = tinymce.ScriptLoader, ln = t.mceInit.language, th = t.mceInit.theme, pl = t.mceInit.plugins;

		      sl.markDone(t.base + '/langs/' + ln + '.js');

		      sl.markDone(t.base + '/themes/' + th + '/langs/' + ln + '.js');
		      sl.markDone(t.base + '/themes/' + th + '/langs/' + ln + '_dlg.js');

		      tinymce.each(pl.split(','), function(n) {
			      if (n && n.charAt(0) != '-') {
				      sl.markDone(t.base + '/plugins/' + n + '/langs/' + ln + '.js');
				      sl.markDone(t.base + '/plugins/' + n + '/langs/' + ln + '_dlg.js');
			      }
		      });
	      },

	      load_ext : function(url,lang) {
		      var sl = tinymce.ScriptLoader;

		      sl.markDone(url + '/langs/' + lang + '.js');
		      sl.markDone(url + '/langs/' + lang + '_dlg.js');
	      }
      };
      
      var subBtn = document.getElementById("submit");
	   if (subBtn != null) {
	      subBtn.onclick=function() {
	         var inst = tinyMCE.getInstanceById("comment");
	         document.getElementById("comment").value = inst.getContent();
	         document.getElementById("commentform").submit();
	         return false;
	      }
	   }
	   tinyMCEPreInit.go();
      tinyMCE.init(tinyMCEPreInit.mceInit);
      /* ]]> */
      </script>
      
	<?php
}

function mcecomment_init() {
	global $post;
	$loadJS = false;
	if (is_plugin_page()) {
	   $loadJS = true;
	} else if (is_singular()) {
	   if (comments_open() && ( !get_option('comment_registration') || is_user_logged_in() )) {	
	      $loadJS = true;
	   }
	}
	if ($loadJS)
	   mcecomment_getInitJS();
}

function mcecomment_isGreaterThan($ver) {
	global $wp_version;

	//Cater WP_Security
	if ($wp_version == 'abc') return true;
	list($Cmajor, $Cminor, $Crev) = explode('.', $ver);
	list($major, $minor, $rev) = explode('.', $wp_version);
	if ($major < $Cmajor) return false;
	if ($minor < $Cminor) return false;
	
	return true;
}

function mcecomment_admin_init() {
   register_setting('mceComments', 'mcecomment_options');
}

function mcecomment_admin_page_init() {
   global $mce_locale;

   wp_enqueue_script('tiny_mce', get_option('siteurl') . '/wp-includes/js/tinymce/tiny_mce.js', false, '20081129');
	wp_enqueue_script('tiny_mce_lang', get_option('siteurl') . '/wp-includes/js/tinymce/langs/wp-langs-' . $mce_locale . '.js', false, '20081129');
	mcecomment_getInitJS();
}

function mcecomment_loadCoreJS() {
   global $post, $mce_locale;
   if (is_singular()) {
	   if (comments_open() && ( !get_option('comment_registration') || is_user_logged_in() )) {
	      wp_enqueue_script('tiny_mce', get_option('siteurl') . '/wp-includes/js/tinymce/tiny_mce.js', false, '20081129');
	      wp_enqueue_script('tiny_mce_lang', get_option('siteurl') . '/wp-includes/js/tinymce/langs/wp-langs-' . $mce_locale . '.js', false, '20081129');
	      wp_deregister_script('comment-reply');
	      wp_enqueue_script( 'comment-reply', get_option('siteurl') . '/wp-content/plugins/' . plugin_basename ( dirname ( __FILE__ ) ) . "/comment-reply.dev.js", false, '20090102');
	   }
	}
}

add_action('template_redirect', 'mcecomment_loadCoreJS');
add_action('wp_head', 'mcecomment_init');
add_action('admin_menu', 'mcecomment_adminpages');
add_action('admin_init', 'mcecomment_admin_init');
add_option('mcecomment_options', '', 'TinyMCE Comments');
?>
