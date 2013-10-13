<?php

/*

	Library for the Recent Posts, Random Posts, Recent Comments, and Similar Posts plugins
	-- provides the admin routines which the plugins share

*/

define('ACF_LIBRARY', true);

function ppl_options_from_post($options, $args) {
	foreach ($args as $arg) {
		switch ($arg) {
		case 'limit':
		case 'skip':
		    $options[$arg] = ppl_check_cardinal($_POST[$arg]);
			break;
		case 'excluded_cats':
		case 'included_cats':
			if (isset($_POST[$arg])) {	
				// get the subcategories too
				if (function_exists('get_term_children')) {
					$catarray = $_POST[$arg];
					foreach ($catarray as $cat) {
						$catarray = array_merge($catarray, get_term_children($cat, 'category'));
					}
					$_POST[$arg] = array_unique($catarray);
				}
				$options[$arg] = implode(',', $_POST[$arg]);
			} else {
				$options[$arg] = '';
			}	
			break;
		case 'excluded_authors':
		case 'included_authors':
			if (isset($_POST[$arg])) {
				$options[$arg] = implode(',', $_POST[$arg]);
			} else {
				$options[$arg] = '';
			}	
			break;
		case 'excluded_posts':
		case 'included_posts':
			$check = explode(',', rtrim($_POST[$arg]));
			$ids = array();
			foreach ($check as $id) {
				$id = ppl_check_cardinal($id);
				if ($id !== 0) $ids[] = $id;
			}
			$options[$arg] = implode(',', array_unique($ids));
			break;
		case 'stripcodes':
			$st = explode("\n", trim($_POST['starttags']));
			$se = explode("\n", trim($_POST['endtags']));
			if (count($st) != count($se)) {
				$options['stripcodes'] = array(array());
			} else {
				$num = count($st);
				for ($i = 0; $i < $num; $i++) {
					$options['stripcodes'][$i]['start'] = $st[$i];
					$options['stripcodes'][$i]['end'] = $se[$i];
				}
			}
			break;
		case 'age':
			$options['age']['direction'] = $_POST['age-direction'];
			$options['age']['length'] = ppl_check_cardinal($_POST['age-length']);
			$options['age']['duration'] = $_POST['age-duration'];
			break;
		case 'custom':
			$options['custom']['key'] = $_POST['custom-key'];
			$options['custom']['op'] = $_POST['custom-op'];
			$options['custom']['value'] = $_POST['custom-value'];
			break;
		case 'sort':
			$options['sort']['by1'] = $_POST['sort-by1'];
			$options['sort']['order1'] = $_POST['sort-order1'];
			if ($options['sort']['order1'] === 'SORT_ASC') $options['sort']['order1'] = SORT_ASC; else $options['sort']['order1'] = SORT_DESC; 
			$options['sort']['case1'] = $_POST['sort-case1'];
			$options['sort']['by2'] = $_POST['sort-by2'];
			$options['sort']['order2'] = $_POST['sort-order2'];
			if ($options['sort']['order2'] === 'SORT_ASC') $options['sort']['order2'] = SORT_ASC; else $options['sort']['order2'] = SORT_DESC; 
			$options['sort']['case2'] = $_POST['sort-case2'];
			if ($options['sort']['by1'] === '') {
				$options['sort']['order1'] = SORT_ASC;
				$options['sort']['case1'] = 'false';
				$options['sort']['by2'] = '';
			}
			if ($options['sort']['by2'] === '') {
				$options['sort']['order2'] = SORT_ASC;
				$options['sort']['case2'] = 'false';
			}
			break;
		case 'status':
			unset($options['status']);
			$options['status']['publish'] = $_POST['status-publish'];
			$options['status']['private'] = $_POST['status-private'];
			$options['status']['draft'] = $_POST['status-draft'];
			$options['status']['future'] = $_POST['status-future'];
			break;
		case 'num_terms':
			$options['num_terms'] = $_POST['num_terms'];
			if ($options['num_terms'] < 1) $options['num_terms'] = 20;
			break;
		default:
			$options[$arg] = trim($_POST[$arg]);
		}
	}
	return $options;
}

function ppl_check_cardinal($string) {
	$value = intval($string);
	return ($value > 0) ? $value : 0;
}

function ppl_display_available_tags($plugin_name) {
	?>
		<h3><?php _e('Available Tags', 'post_plugin_library'); ?></h3>
		<ul style="list-style-type: none;">
		<li title="">{author}</li>
		<li title="">{authorurl}</li>
		<li title="">{categoryid}</li>
		<li title="">{categorylinks}</li>
		<li title="">{categorynames}</li>
		<li title="">{commentcount}</li>
		<li title="">{custom}</li>
		<li title="">{date}</li>
		<li title="">{dateedited}</li>
		<li title="">{excerpt}</li>
		<li title="">{fullpost}</li>
		<li title="">{gravatar}</li>
		<li title="">{if}</li>
		<li title="">{image}</li>
		<li title="">{imagealt}</li>
		<li title="">{imagesrc}</li>
		<li title="">{link}</li>
		<li title="">{php}</li>
		<li title="">{postid}</li>
		<li title="">{postviews}</li>
		<?php if ($plugin_name === 'similar-posts') { ?>
			<li title="">{score}</li>
		<?php } ?>
		<li title="">{snippet}</li>
		<li title="">{tags}</li>
		<li title="">{taglinks}</li>
		<li title="">{title}</li>
		<li title="">{time}</li>
		<li title="">{timeedited}</li>
		<li title="">{totalpages}</li>
		<li title="">{totalposts}</li>
		<li title="">{url}</li>
		</ul>
	<?php
}

function ppl_display_available_comment_tags() {
	?>
		<ul style="list-style-type: none;">
		<li title="">{commentexcerpt}</li>
		<li title="">{commentsnippet}</li>
		<li title="">{commentdate}</li>
		<li title="">{commenttime}</li>
		<li title="">{commentdategmt}</li>
		<li title="">{commenttimegmt}</li>
		<li title="">{commenter}</li>
		<li title="">{commenterip}</li>
		<li title="">{commenterurl}</li>
		<li title="">{commenterlink}</li>
		<li title="">{commenturl}</li>
		<li title="">{commentpopupurl}</li>
		<li title="">{commentlink}</li>
		<li title="">{commentlink2}</li>
		</ul>
	<?php
}

/*

	inserts a form button to submit a bug report to my web site
	
*/
function get_plugin_version($prefix) {
	$plugin_version = str_replace('-', '_', $prefix) . '_version';
	global $$plugin_version;
	return ${$plugin_version};
}

function ppl_bug_form($options_key) {
	global $wp_version;
	$template_name = basename(get_bloginfo('template_url'));
	$options = get_option($options_key);	
	$options['mbstring'] = intval(function_exists('mb_internal_encoding'));
	$woptions = get_option('widget_rrm_'.str_replace('-', '_', $options_key)); 
	?>
	<div class="wrap">
	<h2>Report a Bug</h2>
	<form method="post" action="http://rmarsh.com/report-a-bug/">
	<p><?php _e('This option takes you to my site where you can inform me of any issues 
	you are having with this plugin. It also passes along useful debugging information such as 
	which versions of WordPress, PHP, and MySQL you are using, as well as the current 
	plugin settings.', 'post_plugin_library'); ?></p>
	<div class="submit"><input type="submit" name="report_bug" value="<?php _e('File Report', 'post_plugin_library') ?>"  /></div>
	<input type="hidden" name="plugin" value="<?php echo $options_key; ?>" />
	<input type="hidden" name="plugin_version" value="<?php echo get_plugin_version($options_key); ?>" />	
	<input type="hidden" name="wp_version" value="<?php echo $wp_version; ?>" />
	<input type="hidden" name="php_version" value="<?php echo PHP_VERSION; ?>" />
	<input type="hidden" name="mysql_version" value="<?php echo mysql_get_client_info(); ?>" />
	<input type="hidden" name="wp_language" value='<?php echo WPLANG; ?>' />
	<input type="hidden" name="template" value='<?php echo $template_name; ?>' />
	<input type="hidden" name="options_set" value='<?php echo serialize($options); ?>' />
	<input type="hidden" name="widget_options_set" value='<?php echo serialize($woptions); ?>' />
	</form>
	</div>
	<?php
}

/*

	inserts a form button to completely remove the plugin and all its options etc.

*/
function ppl_plugin_eradicate_form($plugin_file) {
	if (isset($_POST['eradicate-plugin'])) {
		check_admin_referer('eradicate-plugin'); 
		if (ppl_confirm_eradicate()) {
			if (defined('POC_CACHE_4')) poc_cache_flush();
			$file = ppl_plugin_basename($plugin_file);
			if (!defined('WP_PLUGIN_DIR')) define('WP_PLUGIN_DIR', ABSPATH . 'wp-content/plugins'); 			if ( file_exists( WP_PLUGIN_DIR . '/' . dirname($file) . '/uninstall.php' ) ) {
				define('WP_UNINSTALL_PLUGIN', $file);
				include WP_PLUGIN_DIR . '/' . dirname($file) . '/uninstall.php';
			}
			ppl_deactivate_plugin($plugin_file);
			echo '<div class="updated fade"><p>' . __('The plugin and all its settings have been completely removed', 'post_plugin_library') . '</p></div>';
			exit;
		} 
	}
	?>
	<div class="wrap">
	<h2>Remove this Plugin</h2>
	<form method="post" action="">
	<p><?php _e('Deactivating a plugin from the Plugins page usually leaves all the plugin\'s
	settings intact. Often this is the desired behaviour as you can then choose to reactivate the plugin 
	and all your settings will still be in place. If, however, you want to remove this plugin 
	completely, along with all its settings and tables, you can do so by pressing the button below.', 'post_plugin_library'); ?></p>
	<div class="submit">
	<p><label for="eradicate-check"><input type="checkbox" name="eradicate-check" value="yes" /> check this box to confirm your intention</label></p>	
	<input type="submit" name="eradicate-plugin" id="eradicate-plugin" value="<?php _e('Remove Plugin', 'post_plugin_library') ?>"  />
	</div>
	<?php if (function_exists('wp_nonce_field')) wp_nonce_field('eradicate-plugin'); ?>
	</form>
	</div>
	<?php

}

function ppl_confirm_eradicate() {
 return (isset($_POST['eradicate-check']) && 'yes'===$_POST['eradicate-check']);
}

function ppl_deactivate_plugin($plugin_file) {
	$current = get_option('active_plugins');
	$plugin_file = substr($plugin_file, strlen(WP_PLUGIN_DIR)+1);
	$plugin_file = str_replace('\\', '/', $plugin_file);
	if (in_array($plugin_file, $current)) {
		array_splice($current, array_search($plugin_file, $current), 1); 
		update_option('active_plugins', $current);
	}
}


/*

	For the display of the option pages

*/

function ppl_display_limit($limit) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Number of posts to show:', 'post_plugin_library') ?></th>
		<td><input name="limit" type="text" id="limit" value="<?php echo $limit; ?>" size="2" /></td>
	</tr>
	<?php
}

function ppl_display_unique($unique) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Show just one comment per post?', 'post_plugin_library') ?></th>
		<td>
		<select name="unique" id="unique" >
		<option <?php if($unique == 'false') { echo 'selected="selected"'; } ?> value="false">No</option>
		<option <?php if($unique == 'true') { echo 'selected="selected"'; } ?> value="true">Yes</option>
		</select> 
		</td>
	</tr>
	<?php
}

function ppl_display_skip($skip) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Number of posts to skip:', 'post_plugin_library') ?></th>
		<td><input name="skip" type="text" id="skip" value="<?php echo $skip; ?>" size="2" /></td>
	</tr>
	<?php
}

function ppl_display_omit_current_post($omit_current_post) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Omit the current post?', 'post_plugin_library') ?></th>
		<td>
		<select name="omit_current_post" id="omit_current_post" >
		<option <?php if($omit_current_post == 'false') { echo 'selected="selected"'; } ?> value="false">No</option>
		<option <?php if($omit_current_post == 'true') { echo 'selected="selected"'; } ?> value="true">Yes</option>
		</select> 
		</td>
	</tr>
	<?php
}

function ppl_display_just_current_post($just_current_post) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Show just the current post?', 'post_plugin_library') ?></th>
		<td>
		<select name="just_current_post" id="just_current_post" >
		<option <?php if($just_current_post == 'false') { echo 'selected="selected"'; } ?> value="false">No</option>
		<option <?php if($just_current_post == 'true') { echo 'selected="selected"'; } ?> value="true">Yes</option>
		</select> 
		</td>
	</tr>
	<?php
}

function ppl_display_show_private($show_private) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Show password-protected posts?', 'post_plugin_library') ?></th>
		<td>
		<select name="show_private" id="show_private">
		<option <?php if($show_private == 'false') { echo 'selected="selected"'; } ?> value="false">No</option>
		<option <?php if($show_private == 'true') { echo 'selected="selected"'; } ?> value="true">Yes</option>
		</select> 
		</td>
	</tr>
	<?php
}

function ppl_display_show_pages($show_pages) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Show static pages?', 'post_plugin_library') ?></th>
		<td>
			<select name="show_pages" id="show_pages">
			<option <?php if($show_pages == 'false') { echo 'selected="selected"'; } ?> value="false">No pages, just posts</option>
			<option <?php if($show_pages == 'true') { echo 'selected="selected"'; } ?> value="true">Both pages and posts</option>
			<option <?php if($show_pages == 'but') { echo 'selected="selected"'; } ?> value="but">Pages but no posts</option>
			</select>
		</td> 
	</tr>
	<?php
}

function ppl_display_show_attachments($show_attachments) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Show attachments?', 'post_plugin_library') ?></th>
		<td>
			<select name="show_attachments" id="show_attachments">
			<option <?php if($show_attachments == 'false') { echo 'selected="selected"'; } ?> value="false">No</option>
			<option <?php if($show_attachments == 'true') { echo 'selected="selected"'; } ?> value="true">Yes</option>
			</select>
		</td> 
	</tr>
	<?php
}

function ppl_display_match_author($match_author) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Match the current post\'s author?', 'post_plugin_library') ?></th>
		<td>
			<select name="match_author" id="match_author">
			<option <?php if($match_author == 'false') { echo 'selected="selected"'; } ?> value="false">No</option>
			<option <?php if($match_author == 'true') { echo 'selected="selected"'; } ?> value="true">Yes</option>
			</select>
		</td> 
	</tr>
	<?php
}

function ppl_display_match_cat($match_cat) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Match the current post\'s category?', 'post_plugin_library') ?></th>
		<td>
			<select name="match_cat" id="match_cat">
			<option <?php if($match_cat == 'false') { echo 'selected="selected"'; } ?> value="false">No</option>
			<option <?php if($match_cat == 'true') { echo 'selected="selected"'; } ?> value="true">Yes</option>
			</select>
		</td> 
	</tr>
	<?php
}

function ppl_display_match_tags($match_tags) {
	global $wp_version;
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Match the current post\'s tags?', 'post_plugin_library') ?></th>
		<td>
			<select name="match_tags" id="match_tags" <?php if ($wp_version < 2.3) echo 'disabled="true"'; ?> >
			<option <?php if($match_tags == 'false') { echo 'selected="selected"'; } ?> value="false">No</option>
			<option <?php if($match_tags == 'any') { echo 'selected="selected"'; } ?> value="any">Any tag</option>
			<option <?php if($match_tags == 'all') { echo 'selected="selected"'; } ?> value="all">Every tag</option>
			</select>
		</td> 
	</tr>
	<?php
}

function ppl_display_none_text($none_text) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Default display if no matches:', 'post_plugin_library') ?></th>
		<td><input name="none_text" type="text" id="none_text" value="<?php echo htmlspecialchars(stripslashes($none_text)); ?>" size="40" /></td>
	</tr>
	<?php
}

function ppl_display_no_text($no_text) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Show nothing if no matches?', 'post_plugin_library') ?></th>
		<td>
			<select name="no_text" id="no_text">
			<option <?php if($no_text == 'false') { echo 'selected="selected"'; } ?> value="false">No</option>
			<option <?php if($no_text == 'true') { echo 'selected="selected"'; } ?> value="true">Yes</option>
			</select>
		</td> 
	</tr>
	<?php
}

function ppl_display_prefix($prefix) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Text and codes before the list:', 'post_plugin_library') ?></th>
		<td><input name="prefix" type="text" id="prefix" value="<?php echo htmlspecialchars(stripslashes($prefix)); ?>" size="40" /></td>
	</tr>
	<?php
}

function ppl_display_suffix($suffix) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Text and codes after the list:', 'post_plugin_library') ?></th>
		<td><input name="suffix" type="text" id="suffix" value="<?php echo htmlspecialchars(stripslashes($suffix)); ?>" size="40" /></td>
	</tr>
	<?php
}

function ppl_display_output_template($output_template) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Output template:', 'post_plugin_library') ?></th>
		<td><textarea name="output_template" id="output_template" rows="4" cols="38"><?php echo htmlspecialchars(stripslashes($output_template)); ?></textarea></td>
	</tr>
	<?php
}

function ppl_display_divider($divider) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Text and codes between items:', 'post_plugin_library') ?></th>
		<td><input name="divider" type="text" id="divider" value="<?php echo $divider; ?>" size="40" /></td>
	</tr>
	<?php
}

function ppl_display_tag_str($tag_str) {
	global $wp_version;
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Match posts with tags:<br />(a,b matches posts with either tag, a+b only matches posts with both tags)', 'post_plugin_library') ?></th>
		<td><input name="tag_str" type="text" id="tag_str" value="<?php echo $tag_str; ?>" <?php if ($wp_version < 2.3) echo 'disabled="true"'; ?> size="40" /></td>
	</tr>
	<?php
}

function ppl_display_excluded_posts($excluded_posts) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Posts to exclude:', 'post_plugin_library') ?></th>
		<td><input name="excluded_posts" type="text" id="excluded_posts" value="<?php echo $excluded_posts; ?>" size="40" /> <?php _e('comma-separated IDs', 'post_plugin_library'); ?></td>
	</tr>
	<?php
}

function ppl_display_included_posts($included_posts) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Posts to include:', 'post_plugin_library') ?></th>
		<td><input name="included_posts" type="text" id="included_posts" value="<?php echo $included_posts; ?>" size="40" /> <?php _e('comma-separated IDs', 'post_plugin_library'); ?></td>
	</tr>
	<?php
}

function ppl_display_authors($excluded_authors, $included_authors) {
	global $wpdb;
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Authors to exclude/include:', 'post_plugin_library') ?></th>
		<td>
			<table border="1">	
			<?php 
				$users = $wpdb->get_results("SELECT ID, user_login FROM $wpdb->users ORDER BY user_login");
				if ($users) {
					$excluded = explode(',', $excluded_authors);
					$included = explode(',', $included_authors);
					echo "\n\t<tr valign=\"top\"><td style=\"border-bottom-width: 0px;\" ><strong>Author</strong></td><td style=\"border-bottom-width: 0px;\">Exclude</td><td style=\"border-bottom-width: 0px;\">Include</td></tr>";
					foreach ($users as $user) {
						if (false === in_array($user->ID, $excluded)) {
							$ex_ischecked = '';
						} else {
							$ex_ischecked = 'checked';
						}
						if (false === in_array($user->ID, $included)) {
							$in_ischecked = '';
						} else {
							$in_ischecked = 'checked';
						}
						echo "\n\t<tr valign=\"top\"><td style=\"border-bottom-width: 0px;\">$user->user_login</td><td style=\"border-bottom-width: 0px;\"><input type=\"checkbox\" name=\"excluded_authors[]\" value=\"$user->ID\" $ex_ischecked /></td><td style=\"border-bottom-width: 0px;\"><input type=\"checkbox\" name=\"included_authors[]\" value=\"$user->ID\" $in_ischecked /></td></tr>";
					}
				}	
			?>
			</table>
		</td> 
	</tr>
	<?php
}

function ppl_display_cats($excluded_cats, $included_cats) {
	global $wpdb;
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Categories to exclude/include:', 'post_plugin_library') ?></th>
		<td>
			<table border="1">	
			<?php 
				if (function_exists("get_categories")) {
					$categories = get_categories();//('&hide_empty=1');
				} else {
					//$categories = $wpdb->get_results("SELECT * FROM $wpdb->categories WHERE category_count <> 0 ORDER BY cat_name");
					$categories = $wpdb->get_results("SELECT * FROM $wpdb->categories ORDER BY cat_name");
				}
				if ($categories) {
					echo "\n\t<tr valign=\"top\"><td style=\"border-bottom-width: 0px;\"><strong>Category</strong></td><td style=\"border-bottom-width: 0px;\">Exclude</td><td style=\"border-bottom-width: 0px;\">Include</td></tr>";
					$excluded = explode(',', $excluded_cats);
					$included = explode(',', $included_cats);
					$level = 0;
					$cats_added = array();
					$last_parent = 0;
					$cat_parent = 0;
					foreach ($categories as $category) {
						$category->cat_name = wp_specialchars($category->cat_name);
						if (false === in_array($category->cat_ID, $excluded)) {
							$ex_ischecked = '';
						} else {
							$ex_ischecked = 'checked';
						}
						if (false === in_array($category->cat_ID, $included)) {
							$in_ischecked = '';
						} else {
							$in_ischecked = 'checked';
						}
						$last_parent = $cat_parent;
						$cat_parent = $category->category_parent;
						if ($cat_parent == 0) {
							$level = 0;
						} elseif ($last_parent != $cat_parent) {
							if (in_array($cat_parent, $cats_added)) {
								$level = $level - 1;
							} else {
								$level = $level + 1;
							}
							$cats_added[] = $cat_parent;
						}
						$pad = str_repeat('&nbsp;', 3*$level);
						echo "\n\t<tr valign=\"top\"><td style=\"border-bottom-width: 0px;\">$pad$category->cat_name</td><td style=\"border-bottom-width: 0px;\"><input type=\"checkbox\" name=\"excluded_cats[]\" value=\"$category->cat_ID\" $ex_ischecked /></td><td style=\"border-bottom-width: 0px;\"><input type=\"checkbox\" name=\"included_cats[]\" value=\"$category->cat_ID\" $in_ischecked /></td></tr>";
					}
				}
			?>
			</table>
		</td> 
	</tr>
	<?php
}

function ppl_display_stripcodes($stripcodes) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Other plugins\' tags to remove from snippet:', 'post_plugin_library') ?></th>
		<td>
			<table>	
			<tr><td style="border-bottom-width: 0"><?php _e('opening', 'post_plugin_library') ?></td><td style="border-bottom-width: 0"><?php _e('closing', 'post_plugin_library') ?></td></tr>
			<tr valign="top"><td style="border-bottom-width: 0"><textarea name="starttags" id="starttags" rows="4" cols="10"><?php foreach ($stripcodes as $tag) echo htmlspecialchars(stripslashes($tag['start']))."\n"; ?></textarea></td><td style="border-bottom-width: 0"><textarea name="endtags" id="endtags" rows="4" cols="10"><?php foreach ($stripcodes as $tag) echo htmlspecialchars(stripslashes($tag['end']))."\n"; ?></textarea></td></tr>
			</table>
		</td> 
	</tr>
	<?php
}

function ppl_display_age($age) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Ignore posts :', 'post_plugin_library') ?></th>
		<td>
			<table><tr>
			<td style="border-bottom-width: 0">
				<select name="age-direction" id="age-direction">
				<option <?php if($age['direction'] == 'before') { echo 'selected="selected"'; } ?> value="before">less than</option>
				<option <?php if($age['direction'] == 'after') { echo 'selected="selected"'; } ?> value="after">more than</option>
				<option <?php if($age['direction'] == 'none') { echo 'selected="selected"'; } ?> value="none">-----</option>
				</select>
			</td>
			<td style="border-bottom-width: 0"><input name="age-length" type="text" id="age-length" value="<?php echo $age['length']; ?>" size="4" /></td>
			<td style="border-bottom-width: 0">
				<select name="age-duration" id="age-duration">
				<option <?php if($age['duration'] == 'day') { echo 'selected="selected"'; } ?> value="day">day(s)</option>
				<option <?php if($age['duration'] == 'month') { echo 'selected="selected"'; } ?> value="month">month(s)</option>
				<option <?php if($age['duration'] == 'year') { echo 'selected="selected"'; } ?> value="year">year(s)</option>
				</select>
				old
			</td>
			</tr></table>
		</td>
	</tr>
	<?php
}

function ppl_display_status($status) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Display posts that are:', 'post_plugin_library') ?></th>
		<td>
			<table><tr>
			<td style="border-bottom-width: 0">
				Published
				<select name="status-publish" id="status-publish" <?php if (!function_exists('get_post_type')) echo 'disabled="true"'; ?>>
				<option <?php if($status['publish'] == 'false') { echo 'selected="selected"'; } ?> value="false">No</option>
				<option <?php if($status['publish'] == 'true') { echo 'selected="selected"'; } ?> value="true">Yes</option>
				</select>
			</td>
			<td style="border-bottom-width: 0">
				Private
				<select name="status-private" id="status-private" <?php if (!function_exists('get_post_type')) echo 'disabled="true"'; ?>>
				<option <?php if($status['private'] == 'false') { echo 'selected="selected"'; } ?> value="false">No</option>
				<option <?php if($status['private'] == 'true') { echo 'selected="selected"'; } ?> value="true">Yes</option>
				</select>
			</td>
			<td style="border-bottom-width: 0">
				Draft
				<select name="status-draft" id="status-draft" <?php if (!function_exists('get_post_type')) echo 'disabled="true"'; ?>>
				<option <?php if($status['draft'] == 'false') { echo 'selected="selected"'; } ?> value="false">No</option>
				<option <?php if($status['draft'] == 'true') { echo 'selected="selected"'; } ?> value="true">Yes</option>
				</select>
			</td>
			<td style="border-bottom-width: 0">
				Future
				<select name="status-future" id="status-future" <?php if (!function_exists('get_post_type')) echo 'disabled="true"'; ?>>
				<option <?php if($status['future'] == 'false') { echo 'selected="selected"'; } ?> value="false">No</option>
				<option <?php if($status['future'] == 'true') { echo 'selected="selected"'; } ?> value="true">Yes</option>
				</select>
			</td>
			</tr></table>
		</td>
	</tr>
	<?php
}

function ppl_display_custom($custom) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Match posts by custom field:', 'post_plugin_library') ?></th>
		<td>
			<table>
			<tr><td style="border-bottom-width: 0">Field Name</td><td style="border-bottom-width: 0"></td><td style="border-bottom-width: 0">Field Value</td></tr>
			<tr>
			<td style="border-bottom-width: 0"><input name="custom-key" type="text" id="custom-key" value="<?php echo $custom['key']; ?>" size="20" /></td>
			<td style="border-bottom-width: 0">
				<select name="custom-op" id="custom-op">
				<option <?php if($custom['op'] == '=') { echo 'selected="selected"'; } ?> value="=">=</option>
				<option <?php if($custom['op'] == '!=') { echo 'selected="selected"'; } ?> value="!=">!=</option>
				<option <?php if($custom['op'] == '>') { echo 'selected="selected"'; } ?> value=">">></option>
				<option <?php if($custom['op'] == '>=') { echo 'selected="selected"'; } ?> value=">=">>=</option>
				<option <?php if($custom['op'] == '<') { echo 'selected="selected"'; } ?> value="<"><</option>
				<option <?php if($custom['op'] == '<=') { echo 'selected="selected"'; } ?> value="<="><=</option>
				<option <?php if($custom['op'] == 'LIKE') { echo 'selected="selected"'; } ?> value="LIKE">LIKE</option>
				<option <?php if($custom['op'] == 'NOT LIKE') { echo 'selected="selected"'; } ?> value="NOT LIKE">NOT LIKE</option>
				<option <?php if($custom['op'] == 'REGEXP') { echo 'selected="selected"'; } ?> value="REGEXP">REGEXP</option>
				<option <?php if($custom['op'] == 'EXISTS') { echo 'selected="selected"'; } ?> value="EXISTS">EXISTS</option>			
				</select>
			</td>
			<td style="border-bottom-width: 0"><input name="custom-value" type="text" id="custom-value" value="<?php echo $custom['value']; ?>" size="20" /></td>
			</tr>
			</table>
		</td>
	</tr>
	<?php
}

function ppl_display_append($options) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Output after post:', 'post_plugin_library') ?></th>
		<td>
			<table>
			<tr><td style="border-bottom-width: 0">Activate</td><td style="border-bottom-width: 0">Priority</td><td style="border-bottom-width: 0">Parameters</td><td style="border-bottom-width: 0">Condition</td></tr>
			<tr>
			<td style="border-bottom-width: 0">			
				<select name="append_on" id="append_on">
				<option <?php if($options['append_on'] == 'false') { echo 'selected="selected"'; } ?> value="false">No</option>
				<option <?php if($options['append_on'] == 'true') { echo 'selected="selected"'; } ?> value="true">Yes</option>
				</select>
			</td>
			<td style="border-bottom-width: 0"><input name="append_priority" type="text" id="append_priority" value="<?php echo $options['append_priority']; ?>" size="3" /></td>
			<td style="border-bottom-width: 0"><textarea name="append_parameters" id="append_parameters" rows="4" cols="38"><?php echo htmlspecialchars(stripslashes($options['append_parameters'])); ?></textarea></td>
			<td style="border-bottom-width: 0"><textarea name="append_condition" id="append_condition" rows="4" cols="20"><?php echo htmlspecialchars(stripslashes($options['append_condition'])); ?></textarea></td>
			</tr></table>
		</td> 
	</tr>
	<?php
}

function ppl_display_feed($options) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Output in RSS feeds:', 'post_plugin_library') ?></th>
		<td>
			<table>
			<tr><td style="border-bottom-width: 0">Activate</td><td style="border-bottom-width: 0">Priority</td><td style="border-bottom-width: 0">Parameters</td></tr>
			<tr>
			<td style="border-bottom-width: 0">			
				<select name="feed_on" id="feed_on">
				<option <?php if($options['feed_on'] == 'false') { echo 'selected="selected"'; } ?> value="false">No</option>
				<option <?php if($options['feed_on'] == 'true') { echo 'selected="selected"'; } ?> value="true">Yes</option>
				</select>
			</td>
			<td style="border-bottom-width: 0"><input name="feed_priority" type="text" id="feed_priority" value="<?php echo $options['feed_priority']; ?>" size="3" /></td>
			<td style="border-bottom-width: 0"><textarea name="feed_parameters" id="feed_parameters" rows="4" cols="38"><?php echo htmlspecialchars(stripslashes($options['feed_parameters'])); ?></textarea></td>
			</tr></table>
		</td> 
	</tr>
	<?php
}

function ppl_display_widget($options) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Output in widget:', 'post_plugin_library') ?></th>
		<td>
			<table>
			<tr><td style="border-bottom-width: 0"></td><td style="border-bottom-width: 0"></td><td style="border-bottom-width: 0">Parameters</td><td style="border-bottom-width: 0">Condition</td></tr>
			<tr>
			<td style="border-bottom-width: 0;visibility: hidden;">			
				<select name="dummy" id="dummy1">
				<option value="false">No</option>
				<option value="true">Yes</option>
				</select>
			</td>
			<td style="border-bottom-width: 0;visibility: hidden;"><input name="dummy2" type="text" id="dummy2" value="" size="3" /></td>
			<td style="border-bottom-width: 0"><textarea name="widget_parameters" id="widget_parameters" rows="4" cols="38"><?php echo htmlspecialchars(stripslashes($options['widget_parameters'])); ?></textarea></td>
			<td style="border-bottom-width: 0"><textarea name="widget_condition" id="widget_condition" rows="4" cols="20"><?php echo htmlspecialchars(stripslashes($options['widget_condition'])); ?></textarea></td>
			</tr></table>
		</td> 
	</tr>
	<?php
}

function ppl_display_feed_active($feed_active) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Add Similar Posts to feeds? (DEPRECATED! This setting will be removed in the next major release - use the placement settings instead)', 'post_plugin_library') ?></th>
		<td>
		<select name="feed_active" id="feed_active">
		<option <?php if($feed_active == 'false') { echo 'selected="selected"'; } ?> value="false">No</option>
		<option <?php if($feed_active == 'true') { echo 'selected="selected"'; } ?> value="true">Yes</option>
		</select> 
		</td>
	</tr>
	<?php
}

function ppl_display_content_filter($content_filter) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Output in content:<br />(<em>via</em> special tags)', 'post_plugin_library') ?></th>
		<td>
			<table>
			<tr><td style="border-bottom-width: 0">Activate</td></tr>
			<tr>
			<td style="border-bottom-width: 0">			
			<select name="content_filter" id="content_filter">
			<option <?php if($content_filter == 'false') { echo 'selected="selected"'; } ?> value="false">No</option>
			<option <?php if($content_filter == 'true') { echo 'selected="selected"'; } ?> value="true">Yes</option>
			</select>
			</td>
			</tr>
			</table>
		</td> 
	</tr>
	<?php
}

function ppl_display_sort($sort) {
	global $wpdb;
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Sort Output By:<br />leave blank for default order', 'post_plugin_library') ?></th>
		<td>
			<table>
			<tr><td style="border-bottom-width: 0"></td><td style="border-bottom-width: 0">Output Tag</td><td style="border-bottom-width: 0">Order</td><td style="border-bottom-width: 0">Case</td></tr>
			<tr>
			<td style="border-bottom-width: 0">first</td>
			<td style="border-bottom-width: 0"><input name="sort-by1" type="text" id="sort-by1" value="<?php echo $sort['by1']; ?>" size="20" /></td>
			<td style="border-bottom-width: 0">
				<select name="sort-order1" id="sort-order1">
				<option <?php if($sort['order1'] == SORT_ASC) { echo 'selected="selected"'; } ?> value="SORT_ASC">ascending</option>
				<option <?php if($sort['order1'] == SORT_DESC) { echo 'selected="selected"'; } ?> value="SORT_DESC">descending</option>
				</select>
			</td> 
			<td style="border-bottom-width: 0">
				<select name="sort-case1" id="sort-case1">
				<option <?php if($sort['case1'] == 'false') { echo 'selected="selected"'; } ?> value="false">case-sensitive</option>
				<option <?php if($sort['case1'] == 'true') { echo 'selected="selected"'; } ?> value="true">case-insensitive</option>
				</select>
			</td> 
			</tr>
			<tr>
			<td style="border-bottom-width: 0">then</td>
			<td style="border-bottom-width: 0"><input name="sort-by2" type="text" id="sort-by2" value="<?php echo $sort['by2']; ?>" size="20" /></td>
			<td style="border-bottom-width: 0">
				<select name="sort-order2" id="sort-order2">
				<option <?php if($sort['order2'] == SORT_ASC) { echo 'selected="selected"'; } ?> value="SORT_ASC">ascending</option>
				<option <?php if($sort['order2'] == SORT_DESC) { echo 'selected="selected"'; } ?> value="SORT_DESC">descending</option>
				</select>
			</td> 
			<td style="border-bottom-width: 0">
				<select name="sort-case2" id="sort-case2">
				<option <?php if($sort['case2'] == 'false') { echo 'selected="selected"'; } ?> value="false">case-sensitive</option>
				<option <?php if($sort['case2'] == 'true') { echo 'selected="selected"'; } ?> value="true">case-insensitive</option>
				</select>
			</td> 
			</tr>
			</table>
		</td>
	</tr>
	<?php
}

function ppl_display_orderby($options) {
	global $wpdb;
	$limit = 30;
	$keys = $wpdb->get_col( "
		SELECT meta_key
		FROM $wpdb->postmeta
		WHERE meta_key NOT LIKE '\_%'
		GROUP BY meta_key
		ORDER BY meta_id DESC
		LIMIT $limit" );
	$metaselect = "<select id='orderby' name='orderby'>\n\t<option value=''></option>";
	if ( $keys ) {
		natcasesort($keys);
		foreach ( $keys as $key ) {
			$key = attribute_escape( $key );
			if ($options['orderby'] == $key) {
				$metaselect .= "\n\t<option selected='selected' value='$key'>$key</option>";
			} else {
				$metaselect .= "\n\t<option value='$key'>$key</option>";
			}
		}
		$metaselect .= "</select>";
	}

	?>
	<tr valign="top">
		<th scope="row"><?php _e('Select output by custom field:', 'post_plugin_library') ?></th>
		<td>
			<table>
			<tr><td style="border-bottom-width: 0">Field</td><td style="border-bottom-width: 0">Order</td><td style="border-bottom-width: 0">Case</td></tr>
			<tr>
			<td style="border-bottom-width: 0">
			<?php echo $metaselect;	?>	
			</td>
			<td style="border-bottom-width: 0">
				<select name="orderby_order" id="orderby_order">
				<option <?php if($options['orderby_order'] == 'ASC') { echo 'selected="selected"'; } ?> value="ASC">ascending</option>
				<option <?php if($options['orderby_order'] == 'DESC') { echo 'selected="selected"'; } ?> value="DESC">descending</option>
				</select>
			</td> 
			<td style="border-bottom-width: 0">
				<select name="orderby_case" id="orderby_case">
				<option <?php if($options['orderby_case'] == 'false') { echo 'selected="selected"'; } ?> value="false">case-sensitive</option>
				<option <?php if($options['orderby_case'] == 'true') { echo 'selected="selected"'; } ?> value="true">case-insensitive</option>
				<option <?php if($options['orderby_case'] == 'num') { echo 'selected="selected"'; } ?> value="num">numeric</option>
				</select>
			</td> 
			</tr>
			</table>
		</td>
	</tr>
	<?php
}

// now for similar_posts

function ppl_display_num_terms($num_terms) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Maximum number of words to use for match:', 'post_plugin_library') ?></th>
		<td><input name="num_terms" type="text" id="num_terms" value="<?php echo $num_terms; ?>" size="3" /></td>
	</tr>
	<?php
}

function ppl_display_term_extraction($term_extraction) {
	?>
	<tr valign="top">
		<th scope="row" title=""><?php _e('Extract terms to match by:', 'post_plugin_library') ?></th>
		<td>
			<select name="term_extraction" id="term_extraction">
			<option <?php if($term_extraction == 'frequency') { echo 'selected="selected"'; } ?> value="frequency">Word Frequency</option>
			<option <?php if($term_extraction == 'pagerank') { echo 'selected="selected"'; } ?> value="pagerank">TextRank Algorithm</option>
			</select>
		</td> 
	</tr>
	<?php
}

function ppl_display_weights($options) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Relative importance of:', 'post_plugin_library') ?></th>
		<td>
			<table><tr>
			<td style="border-bottom-width: 0"><label for="weight_content" style="float:left;">content:  </label><input name="weight_content" type="text" id="weight_content" value="<?php echo round(100 * $options['weight_content']); ?>" size="3" /> % </td>
			<td style="border-bottom-width: 0"><label for="weight_title" style="float:left;">title:  </label><input name="weight_title" type="text" id="weight_title" value="<?php echo round(100 * $options['weight_title']); ?>" size="3" /> % </td>
			<td style="border-bottom-width: 0"><label for="weight_tags" style="float:left;">tags:  </label><input name="weight_tags" type="text" id="weight_tags" value="<?php echo round(100 * $options['weight_tags']); ?>" size="3" /> % ( adds up to 100% )</td>
			</tr></table>
		</td>
	</tr>
	<?php
}

function ppl_display_hand_links($hand_links) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Look for manual links in custom field?', 'post_plugin_library') ?></th>
		<td>
		<select name="hand_links" id="hand_links">
		<option <?php if($hand_links == 'false') { echo 'selected="selected"'; } ?> value="false">No</option>
		<option <?php if($hand_links == 'true') { echo 'selected="selected"'; } ?> value="true">Yes</option>
		</select> 
		</td>
	</tr>
	<?php
}

// now for recent_comments

function ppl_display_show_type($show_type) {
	?>
	<tr valign="top">
		<th scope="row" title=""><?php _e('Type of comment to show:', 'post_plugin_library') ?></th>
		<td>
			<select name="show_type" id="show_type">
			<option <?php if($show_type == 'all') { echo 'selected="selected"'; } ?> value="all">All kinds of comment</option>
			<option <?php if($show_type == 'comments') { echo 'selected="selected"'; } ?> value="comments">Just plain comments</option>
			<option <?php if($show_type == 'trackbacks') { echo 'selected="selected"'; } ?> value="trackbacks">Just trackbacks and pingbacks</option>
			</select>
		</td> 
	</tr>
	<?php
}

function ppl_display_group_by($group_by) {
	?>
	<tr valign="top">
		<th scope="row" title=""><?php _e('Type of grouping:', 'post_plugin_library') ?></th>
		<td>
			<select name="group_by" id="group_by">
			<option <?php if($group_by == 'post') { echo 'selected="selected"'; } ?> value="post">By Post</option>
			<option <?php if($group_by == 'none') { echo 'selected="selected"'; } ?> value="none">Ungrouped</option>
			<option <?php if($group_by == 'author') { echo 'selected="selected"'; } ?> value="author">By Commenter</option>
			</select>
			(overrides the sort criteria above)
		</td> 
	</tr>
	<?php
}

function ppl_display_group_template($group_template) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Group title template:', 'post_plugin_library') ?></th>
		<td><textarea name="group_template" id="group_template" rows="4" cols="38"><?php echo htmlspecialchars(stripslashes($group_template)); ?></textarea></td>
	</tr>
	<?php
}

function ppl_display_no_author_comments($no_author_comments) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Omit comments by the post author?', 'post_plugin_library') ?></th>
		<td>
			<select name="no_author_comments" id="no_author_comments">
			<option <?php if($no_author_comments == 'false') { echo 'selected="selected"'; } ?> value="false">No</option>
			<option <?php if($no_author_comments == 'true') { echo 'selected="selected"'; } ?> value="true">Yes</option>
			</select>
		</td> 
	</tr>
	<?php
}

function ppl_display_no_user_comments($no_user_comments) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Omit comments by registered users?', 'post_plugin_library') ?></th>
		<td>
			<select name="no_user_comments" id="no_user_comments">
			<option <?php if($no_user_comments == 'false') { echo 'selected="selected"'; } ?> value="false">No</option>
			<option <?php if($no_user_comments == 'true') { echo 'selected="selected"'; } ?> value="true">Yes</option>
			</select>
		</td> 
	</tr>
	<?php
}

function ppl_display_date_modified($date_modified) {
	?>
	<tr valign="top">
		<th scope="row"><?php _e('Order by date of last edit rather than date of creation?', 'post_plugin_library') ?></th>
		<td>
			<select name="date_modified" id="date_modified">
			<option <?php if($date_modified == 'false') { echo 'selected="selected"'; } ?> value="false">No</option>
			<option <?php if($date_modified == 'true') { echo 'selected="selected"'; } ?> value="true">Yes</option>
			</select>
		</td> 
	</tr>
	<?php
}

// 'borrowed', with adaptations, from Stephen Rider at http://striderweb.com/nerdaphernalia/
function ppl_get_plugin_data($plugin_file) {
	// You can optionally pass a specific value to fetch, e.g. 'Version' -- but it's inefficient to do that multiple times
	// As of WP 2.5.1: 'Name', 'Title', 'Description', 'Author', 'Version'
	// As of WP 2.7-bleeding: 'Name', 'PluginURI', 'Description', 'Author', 'AuthorURI', 'Version', 'TextDomain', 'DomainPath'
	if(!function_exists( 'get_plugin_data' ) ) require_once( ABSPATH . 'wp-admin/includes/plugin.php');
	static $plugin_data;
	if(!$plugin_data) {
		$plugin_data = get_plugin_data($plugin_file);
		if (!isset($plugin_data['Title'])) {
			if ('' != $plugin_data['PluginURI'] && '' != $plugin_data['Name']) {
				$plugin_data['Title'] = '<a href="' . $plugin_data['PluginURI'] . '" title="'. __('Visit plugin homepage', 'post-plugin-library') . '">' . $plugin_data['Name'] . '</a>';
			} else {
				$plugin_data['Title'] = $name;
			}
		}
	}
	return $plugin_data;
}

function ppl_admin_footer($plugin_file, $donate_key='') {
	$plugin_data = ppl_get_plugin_data($plugin_file);
	$output = array();
	$output[] = $plugin_data['Title'] . ' plugin';
	$output[] = 'Version ' . $plugin_data['Version'];
	$output[] = 'by ' . $plugin_data['Author'];
	if ($donate_key) {
		$donate_url = 'http://rmarsh.com/donate/' . $donate_key . '/';
		// random shades of red, orange and yellow to attract attention -- subtly I hope
		$colour = '#ff' . dechex(mt_rand(0, 255)) . '00';
		$output[] = '<a href="' . $donate_url . '" style="font-weight: bold;color: '.$colour.';" rel="nofollow" title="If you like ' . $plugin_data['Name'] . ' plugin why not make a tiny/small/large donation towards its upkeep">All donations welcomed!</a>';
	}
	echo implode(' | ', $output) . '<br />';
}

?>