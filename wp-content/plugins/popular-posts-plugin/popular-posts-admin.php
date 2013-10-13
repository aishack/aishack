<?php

// Admin stuff for Popular Posts Plugin, Version 2.6.2.0

function popular_posts_option_menu() {
	add_options_page(__('Popular Posts Options', 'popular_posts_plugin'), __('Popular Posts', 'popular_posts_plugin'), 8, 'popular-posts-plugin', 'popular_posts_options_page');
}

add_action('admin_menu', 'popular_posts_option_menu', 1);

function popular_posts_options_page(){
	echo '<div class="wrap"><h2>';
	_e('Popular Posts ', 'popular_posts_plugin'); 
	echo '<a href="http://rmarsh.com/plugins/post-options/" style="font-size: 0.8em;">';
	_e('help and instructions'); 
	echo '</a></h2></div>';
	if (!PopularPosts::check_post_plugin_library(__('<h1>Please install the <a href="http://downloads.wordpress.org/plugin/post-plugin-library.zip">Post Plugin Library</a> plugin.</h1>'))) return;
	$m = new admin_subpages();
	$m->add_subpage('General', 'general', 'popular_posts_general_options_subpage');
	$m->add_subpage('Output', 'output', 'popular_posts_output_options_subpage');
	$m->add_subpage('Filter', 'filter', 'popular_posts_filter_options_subpage');
	$m->add_subpage('Placement', 'placement', 'popular_posts_placement_options_subpage');
	$m->add_subpage('Other', 'other', 'popular_posts_other_options_subpage');
	$m->add_subpage('Report a Bug', 'bug', 'popular_posts_bug_subpage');
	$m->add_subpage('Remove this Plugin', 'remove', 'popular_posts_remove_subpage');
	$m->display();
	add_action('in_admin_footer', 'popular_posts_admin_footer');
}

function popular_posts_admin_footer() {
	ppl_admin_footer(str_replace('-admin', '', __FILE__), "popular-posts");
}

function popular_posts_general_options_subpage(){
	global $wpdb, $wp_version;
	$options = get_option('popular-posts');
	if (isset($_POST['update_options'])) {
		check_admin_referer('popular-posts-update-options'); 
		if (defined('POC_CACHE_4')) poc_cache_flush();
		// Fill up the options with the values chosen...
		$options = ppl_options_from_post($options, array('limit', 'skip', 'show_private', 'show_pages', 'show_attachments', 'status', 'age', 'omit_current_post', 'match_cat', 'match_tags', 'match_author'));
		update_option('popular-posts', $options);
		// Show a message to say we've done something
		echo '<div class="updated fade"><p>' . __('Options saved', 'popular_posts_plugin') . '</p></div>';
	} 
	//now we drop into html to display the option page form
	?>
		<div class="wrap">
		<h2><?php _e('General Settings', 'popular_posts_plugin'); ?></h2>
		<form method="post" action="">
		<div class="submit"><input type="submit" name="update_options" value="<?php _e('Save General Settings', 'popular_posts_plugin') ?>" /></div>
		<table class="optiontable form-table">
			<?php 
				ppl_display_limit($options['limit']); 
				ppl_display_skip($options['skip']); 
				ppl_display_show_private($options['show_private']); 
				ppl_display_show_pages($options['show_pages']); 
				ppl_display_show_attachments($options['show_attachments']); 
				ppl_display_status($options['status']);
				ppl_display_age($options['age']);
				ppl_display_omit_current_post($options['omit_current_post']); 
				ppl_display_match_cat($options['match_cat']); 
				ppl_display_match_tags($options['match_tags']); 
				ppl_display_match_author($options['match_author']); 
			?>
		</table>
		<div class="submit"><input type="submit" name="update_options" value="<?php _e('Save General Settings', 'popular_posts_plugin') ?>" /></div>
		<?php if (function_exists('wp_nonce_field')) wp_nonce_field('popular-posts-update-options'); ?>
		</form>  
	</div>
	<?php	
}

function popular_posts_output_options_subpage(){
	global $wpdb, $wp_version;
	$options = get_option('popular-posts');
	if (isset($_POST['update_options'])) {
		check_admin_referer('popular-posts-update-options'); 
		if (defined('POC_CACHE_4')) poc_cache_flush();
		// Fill up the options with the values chosen...
		$options = ppl_options_from_post($options, array('output_template', 'prefix', 'suffix', 'none_text', 'no_text', 'divider', 'sort', 'group_template'));
		update_option('popular-posts', $options);
		// Show a message to say we've done something
		echo '<div class="updated fade"><p>' . __('Options saved', 'popular_posts_plugin') . '</p></div>';
	} 
	//now we drop into html to display the option page form
	?>
		<div class="wrap">
		<h2><?php _e('Output Settings', 'popular_posts_plugin'); ?></h2>
		<form method="post" action="">
		<div class="submit"><input type="submit" name="update_options" value="<?php _e('Save Output Settings', 'popular_posts_plugin') ?>" /></div>
		<table class="optiontable form-table">
			<tr>
			<td>
			<table>
			<?php 
				ppl_display_output_template($options['output_template']); 
				ppl_display_prefix($options['prefix']); 
				ppl_display_suffix($options['suffix']); 
				ppl_display_none_text($options['none_text']); 
				ppl_display_no_text($options['no_text']); 
				ppl_display_divider($options['divider']); 
				ppl_display_sort($options['sort']);
				ppl_display_group_template($options['group_template']); 
			?>
			</table>
			</td>
			<td>
			<?php ppl_display_available_tags('popular-posts'); ?>
			</td></tr>
		</table>
		<div class="submit"><input type="submit" name="update_options" value="<?php _e('Save Output Settings', 'popular_posts_plugin') ?>" /></div>
		<?php if (function_exists('wp_nonce_field')) wp_nonce_field('popular-posts-update-options'); ?>
		</form>  
	</div>
	<?php	
}

function popular_posts_filter_options_subpage(){
	global $wpdb, $wp_version;
	$options = get_option('popular-posts');
	if (isset($_POST['update_options'])) {
		check_admin_referer('popular-posts-update-options'); 
		if (defined('POC_CACHE_4')) poc_cache_flush();
		// Fill up the options with the values chosen...
		$options = ppl_options_from_post($options, array('excluded_posts', 'included_posts', 'excluded_authors', 'included_authors', 'excluded_cats', 'included_cats', 'tag_str', 'custom'));
		update_option('popular-posts', $options);
		// Show a message to say we've done something
		echo '<div class="updated fade"><p>' . __('Options saved', 'popular_posts_plugin') . '</p></div>';
	} 
	//now we drop into html to display the option page form
	?>
		<div class="wrap">
		<h2><?php _e('Filter Settings', 'popular_posts_plugin'); ?></h2>
		<form method="post" action="">
		<div class="submit"><input type="submit" name="update_options" value="<?php _e('Save Filter Settings', 'popular_posts_plugin') ?>" /></div>
		<table class="optiontable form-table">
			<?php 
				ppl_display_excluded_posts($options['excluded_posts']); 
				ppl_display_included_posts($options['included_posts']); 
				ppl_display_authors($options['excluded_authors'], $options['included_authors']); 
				ppl_display_cats($options['excluded_cats'], $options['included_cats']); 
				ppl_display_tag_str($options['tag_str']); 
				ppl_display_custom($options['custom']); 
			?>
		</table>
		<div class="submit"><input type="submit" name="update_options" value="<?php _e('Save Filter Settings', 'popular_posts_plugin') ?>" /></div>
		<?php if (function_exists('wp_nonce_field')) wp_nonce_field('popular-posts-update-options'); ?>
		</form>  
	</div>
	<?php	
}

function popular_posts_placement_options_subpage(){
	global $wpdb, $wp_version;
	$options = get_option('popular-posts');
	if (isset($_POST['update_options'])) {
		check_admin_referer('popular-posts-update-options'); 
		if (defined('POC_CACHE_4')) poc_cache_flush();
		// Fill up the options with the values chosen...
		$options = ppl_options_from_post($options, array('content_filter', 'widget_parameters', 'widget_condition', 'feed_on', 'feed_priority', 'feed_parameters', 'append_on', 'append_priority', 'append_parameters', 'append_condition'));
		update_option('popular-posts', $options);
		// Show a message to say we've done something
		echo '<div class="updated fade"><p>' . __('Options saved', 'popular_posts') . '</p></div>';
	} 
	//now we drop into html to display the option page form
	?>
		<div class="wrap">
		<h2><?php _e('Placement Settings', 'popular_posts'); ?></h2>
		<form method="post" action="">
		<div class="submit"><input type="submit" name="update_options" value="<?php _e('Save Placement Settings', 'popular_posts') ?>" /></div>
		<table class="optiontable form-table">
			<?php 
				ppl_display_append($options); 
				ppl_display_feed($options); 
				ppl_display_widget($options); 
				ppl_display_content_filter($options['content_filter']);
			?>
		</table>
		<div class="submit"><input type="submit" name="update_options" value="<?php _e('Save Placement Settings', 'popular_posts') ?>" /></div>
		<?php if (function_exists('wp_nonce_field')) wp_nonce_field('popular-posts-update-options'); ?>
		</form>  
	</div>
	<?php	
}
function pvc_options_page(){
	global $wpdb;
	// we only reset the counter if both the button is pressed AND the box checked
	if (isset($_POST['reset_count']) && isset($_POST['reset_check']) && 'true' === $_POST['reset_check']) {
		popular_posts_reset();
	}
	// This bit stores any updated values when the Update button has been pressed
	if (isset($_POST['update_options'])) {
		// Fill up the options array as necessary
		$options['exclude_users'] = $_POST['exclude_users'];
		$options['count_single'] = $_POST['count_single'];
		$options['count_page'] = $_POST['count_page'];
		$options['count_home'] = $_POST['count_home'];
		$options['count_archive'] = $_POST['count_archive'];
		$options['count_category'] = $_POST['count_category'];
		$options['count_search'] = $_POST['count_search'];
		$options['count_feed'] = $_POST['count_feed'];
		// store the option values under the plugin filename
		update_option(PVC_OPTION, $options);
		// Show a message to say we've done something
		echo '<div class="updated"><p>' . __('Options saved') . '</p></div>';
	} else {
		// If we are just displaying the page we first load up the options array
		$options = get_option(PVC_OPTION);
	}
	//now we drop into html to display the option page form
	?>
		<div class="wrap">
		<h2><?php _e('Post View Counter Options'); ?></h2>
		<form method="post" action="">
		<fieldset class="options">
		<table class="optiontable">
			<tr valign="top">
				<th scope="row"><?php _e('Exclude views by logged-in users?') ?></th>
				<td>
				<select name="exclude_users" id="exclude_users">
				<option <?php if($options['exclude_users'] == 'false') { echo 'selected="selected"'; } ?> value="false">No</option>
				<option <?php if($options['exclude_users'] == 'true') { echo 'selected="selected"'; } ?> value="true">Yes</option>
				</select> 
				</td>
			</tr>
			<tr valign="top">
				<th scope="row"><?php _e('Count home page views?'); ?></th>
				<td><input type="checkbox" name="count_home" value="true" <?php $ischecked = ($options['count_home']) ? 'checked="checked"' : ''; echo $ischecked ?> /></td>
			</tr>
			<tr valign="top">
				<th scope="row"><?php _e('Count single page views?'); ?></th>
				<td><input type="checkbox" name="count_single" value="true" <?php $ischecked = ($options['count_single']) ? 'checked="checked"' : ''; echo $ischecked ?> /></td>
			</tr>
			<tr valign="top">
				<th scope="row"><?php _e('Count feed page views?'); ?></th>
				<td><input type="checkbox" name="count_feed" value="true" <?php $ischecked = ($options['count_feed']) ? 'checked="checked"' : ''; echo $ischecked ?> /></td>
			</tr>
			<tr valign="top">
				<th scope="row"><?php _e('Count archive page views?'); ?></th>
				<td><input type="checkbox" name="count_archive" value="true" <?php $ischecked = ($options['count_archive']) ? 'checked="checked"' : ''; echo $ischecked ?> /></td>
			</tr>
			<tr valign="top">
				<th scope="row"><?php _e('Count category page views?'); ?></th>
				<td><input type="checkbox" name="count_category" value="true" <?php $ischecked = ($options['count_category']) ? 'checked="checked"' : ''; echo $ischecked ?> /></td>
			</tr>
			<tr valign="top">
				<th scope="row"><?php _e('Count search page views?'); ?></th>
				<td><input type="checkbox" name="count_search" value="true" <?php $ischecked = ($options['count_search']) ? 'checked="checked"' : ''; echo $ischecked ?> /></td>
			</tr>
			<tr valign="top">
				<th scope="row"><?php _e('Count static page views?'); ?></th>
				<td><input type="checkbox" name="count_page" value="true" <?php $ischecked = ($options['count_page']) ? 'checked="checked"' : ''; echo $ischecked ?> /></td>
			</tr>
		</table>
		</fieldset>
		<div class="submit"><input type="submit" name="update_options" value="<?php _e('Update') ?>"  style="font-weight:bold;" /></div>
		<p><?php _e('If you wish, you can start counting from scratch by checking the box and pressing the button below which will set all the view counts to zero.') ?></p>
		<div class="submit">	
		<input type="checkbox" name="reset_check" value="true" />
		<?php _e('Check the box to show you really want to reset the counters...'); ?>
		<input type="submit" name="reset_count" value="<?php _e('Reset') ?>" style="font-weight:bold;" />
		</div>		
		</form>    		
	</div>
	<?php	
}


function popular_posts_other_options_subpage(){
	global $wpdb, $wp_version;
	$options = get_option('popular-posts');
	if (isset($_POST['reset_count']) && isset($_POST['reset_check']) && 'true' === $_POST['reset_check']) {
		popular_posts_reset();
	}
	if (isset($_POST['update_options'])) {
		check_admin_referer('popular-posts-update-options'); 
		if (defined('POC_CACHE_4')) poc_cache_flush();
		// Fill up the options with the values chosen...
		$options = ppl_options_from_post($options, array('stripcodes', 'exclude_users', 'count_single', 'count_page', 'count_home', 'count_archive', 'count_category', 'count_search', 'count_feed'));
		update_option('popular-posts', $options);
		// Show a message to say we've done something
		echo '<div class="updated fade"><p>' . __('Options saved', 'popular_posts_plugin') . '</p></div>';
	} 
	//now we drop into html to display the option page form
	?>
		<div class="wrap">
		<h2><?php _e('Other Settings', 'popular_posts_plugin'); ?></h2>
		<form method="post" action="">
		<div class="submit"><input type="submit" name="update_options" value="<?php _e('Save Other Settings', 'popular_posts_plugin') ?>" /></div>
		<table class="optiontable form-table">
			<?php 
				ppl_display_stripcodes($options['stripcodes']); 
			?>
			<tr valign="top">
				<th scope="row"><?php _e('Exclude views by logged-in users?') ?></th>
				<td>
				<select name="exclude_users" id="exclude_users">
				<option <?php if($options['exclude_users'] == 'false') { echo 'selected="selected"'; } ?> value="false">No</option>
				<option <?php if($options['exclude_users'] == 'true') { echo 'selected="selected"'; } ?> value="true">Yes</option>
				</select> 
				</td>
			</tr>
			<tr valign="top">
				<th scope="row"><?php _e('Count home page views?'); ?></th>
				<td><input type="checkbox" name="count_home" value="true" <?php $ischecked = ($options['count_home']) ? 'checked="checked"' : ''; echo $ischecked ?> /></td>
			</tr>
			<tr valign="top">
				<th scope="row"><?php _e('Count single page views?'); ?></th>
				<td><input type="checkbox" name="count_single" value="true" <?php $ischecked = ($options['count_single']) ? 'checked="checked"' : ''; echo $ischecked ?> /></td>
			</tr>
			<tr valign="top">
				<th scope="row"><?php _e('Count feed page views?'); ?></th>
				<td><input type="checkbox" name="count_feed" value="true" <?php $ischecked = ($options['count_feed']) ? 'checked="checked"' : ''; echo $ischecked ?> /></td>
			</tr>
			<tr valign="top">
				<th scope="row"><?php _e('Count archive page views?'); ?></th>
				<td><input type="checkbox" name="count_archive" value="true" <?php $ischecked = ($options['count_archive']) ? 'checked="checked"' : ''; echo $ischecked ?> /></td>
			</tr>
			<tr valign="top">
				<th scope="row"><?php _e('Count category page views?'); ?></th>
				<td><input type="checkbox" name="count_category" value="true" <?php $ischecked = ($options['count_category']) ? 'checked="checked"' : ''; echo $ischecked ?> /></td>
			</tr>
			<tr valign="top">
				<th scope="row"><?php _e('Count search page views?'); ?></th>
				<td><input type="checkbox" name="count_search" value="true" <?php $ischecked = ($options['count_search']) ? 'checked="checked"' : ''; echo $ischecked ?> /></td>
			</tr>
			<tr valign="top">
				<th scope="row"><?php _e('Count static page views?'); ?></th>
				<td><input type="checkbox" name="count_page" value="true" <?php $ischecked = ($options['count_page']) ? 'checked="checked"' : ''; echo $ischecked ?> /></td>
			</tr>
		</table>
		<div class="submit"><input type="submit" name="update_options" value="<?php _e('Save Other Settings', 'popular_posts_plugin') ?>" /></div>
		<?php if (function_exists('wp_nonce_field')) wp_nonce_field('popular-posts-update-options'); ?>
		</form>  
	</div>
	<?php	
}

function popular_posts_bug_subpage(){
	ppl_bug_form('popular-posts'); 
}

function popular_posts_remove_subpage(){
	ppl_plugin_eradicate_form(str_replace('-admin', '', __FILE__)); 
}	

function popular_posts_install() {
	$options = get_option('popular-posts');
	// check each of the option values and, if empty, assign a default (doing it this long way
	// lets us retain old values and add new options in later versions)
	if (!isset($options['exclude_users'])) $options['exclude_users'] = 'true';
	if (!isset($options['count_home'])) $options['count_home'] = 'false';
	if (!isset($options['count_feed'])) $options['count_feed'] = 'false';
	if (!isset($options['count_single'])) $options['count_single'] = 'true';
	if (!isset($options['count_archive'])) $options['count_archive'] = 'false';
	if (!isset($options['count_category'])) $options['count_category'] = 'false';
	if (!isset($options['count_page'])) $options['count_page'] = 'true';
	if (!isset($options['count_search'])) $options['count_search'] = 'false';
	
	if (!isset($options['widget_condition'])) $options['widget_condition'] = '';
	if (!isset($options['widget_parameters'])) $options['widget_parameters'] = '';
	if (!isset($options['feed_on'])) $options['feed_on'] = 'false';
	if (!isset($options['feed_priority'])) $options['feed_priority'] = '10';
	if (!isset($options['feed_parameters'])) $options['feed_parameters'] = 'prefix=<strong>'.__('Popular Posts', 'popular-posts').':</strong><ul class="popular-posts">&suffix=</ul>';
	if (!isset($options['append_on'])) $options['append_on'] = 'false';
	if (!isset($options['append_priority'])) $options['append_priority'] = '10';
	if (!isset($options['append_parameters'])) $options['append_parameters'] = 'prefix=<h3>'.__('Popular Posts', 'popular-posts').':</h3><ul class="popular-posts">&suffix=</ul>';
	if (!isset($options['append_condition'])) $options['append_condition'] = 'is_single()';
	if (!isset($options['limit'])) $options['limit'] = 5;
	if (!isset($options['skip'])) $options['skip'] = 0;
	if (!isset($options['age'])) {$options['age']['direction'] = 'none'; $options['age']['length'] = '0'; $options['age']['duration'] = 'month';}
	if (!isset($options['divider'])) $options['divider'] = '';
	if (!isset($options['omit_current_post'])) $options['omit_current_post'] = 'false';
	if (!isset($options['show_private'])) $options['show_private'] = 'false';
	if (!isset($options['show_pages'])) $options['show_pages'] = 'false';
	if (!isset($options['show_attachments'])) $options['show_attachments'] = 'false';
	// show_static is now show_pages
	if ( isset($options['show_static'])) {$options['show_pages'] = $options['show_static']; unset($options['show_static']);};
	if (!isset($options['none_text'])) $options['none_text'] = __('None Found', 'popular_posts_plugin');
	if (!isset($options['no_text'])) $options['no_text'] = 'false';
	if (!isset($options['tag_str'])) $options['tag_str'] = '';
	if (!isset($options['excluded_cats'])) $options['excluded_cats'] = '';
	// the '9999' flag is now obsolete
	if ($options['excluded_cats'] === '9999') $options['excluded_cats'] = '';
	if (!isset($options['included_cats'])) $options['included_cats'] = '';
	if ($options['included_cats'] === '9999') $options['included_cats'] = '';
	if (!isset($options['excluded_authors'])) $options['excluded_authors'] = '';
	if ($options['excluded_authors'] === '9999') $options['excluded_authors'] = '';
	if (!isset($options['included_authors'])) $options['included_authors'] = '';
	if ($options['included_authors'] === '9999') $options['included_authors'] = '';
	if (!isset($options['included_posts'])) $options['included_posts'] = '';
	if (!isset($options['excluded_posts'])) $options['excluded_posts'] = '';
	if ($options['excluded_posts'] === '9999') $options['excluded_posts'] = '';
	if (!isset($options['stripcodes'])) $options['stripcodes'] = array(array());
	if (!isset($options['prefix'])) $options['prefix'] = '<ul>';
	if (!isset($options['suffix'])) $options['suffix'] = '</ul>';
	if (!isset($options['output_template'])) $options['output_template'] = '<li>{link}</li>';
	if (!isset($options['match_cat'])) $options['match_cat'] = 'false';
	if (!isset($options['match_tags'])) $options['match_tags'] = 'false';
	if (!isset($options['match_author'])) $options['match_author'] = 'false';
	if (!isset($options['content_filter'])) $options['content_filter'] = 'false';
	if (!isset($options['custom'])) {$options['custom']['key'] = ''; $options['custom']['op'] = '='; $options['custom']['value'] = '';}
	if (!isset($options['sort'])) {$options['sort']['by1'] = ''; $options['sort']['order1'] = SORT_ASC; $options['sort']['case1'] = 'false';$options['sort']['by2'] = ''; $options['sort']['order2'] = SORT_ASC; $options['sort']['case2'] = 'false';}
	if (!isset($options['status'])) {$options['status']['publish'] = 'true'; $options['status']['private'] = 'false'; $options['status']['draft'] = 'false'; $options['status']['future'] = 'false';}
	if (!isset($options['group_template'])) $options['group_template'] = '';
	if (!isset($options['date_modified'])) $options['date_modified'] = 'false';
	update_option('popular-posts', $options);
}

if (!function_exists('ppl_plugin_basename')) {
	if ( !defined('WP_PLUGIN_DIR') ) define( 'WP_PLUGIN_DIR', ABSPATH . 'wp-content/plugins' ); 
	function ppl_plugin_basename($file) {
		$file = str_replace('\\','/',$file); // sanitize for Win32 installs
		$file = preg_replace('|/+|','/', $file); // remove any duplicate slash
		$plugin_dir = str_replace('\\','/',WP_PLUGIN_DIR); // sanitize for Win32 installs
		$plugin_dir = preg_replace('|/+|','/', $plugin_dir); // remove any duplicate slash
		$file = preg_replace('|^' . preg_quote($plugin_dir, '|') . '/|','',$file); // get relative path from plugins dir
		return $file;
	}
}

add_action('activate_'.str_replace('-admin', '', ppl_plugin_basename(__FILE__)), 'popular_posts_install');

?>