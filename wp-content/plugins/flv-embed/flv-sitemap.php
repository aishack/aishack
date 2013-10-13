<?php

$flv_sitemap_options = flv_sitemap_get_options();	// retrieve options data from database

/////////////////////////////////////////////////////////////////// option function

function flv_sitemap_get_options()
{
	// default values
	$my_options = array(
		'sitemap_name' => 'videofeed.xml',
		'allow_embed' => 0,
		'allow_thumbnail' => 1,
		'allow_duration' => 0,
		'allow_auto' => 1,
		'last_built' => "",
		'last_ping' => "",
		'built' => 0,
		'server_path' => "",
		'family_safe' => "not_sure"
	);
	
	$options = get_option("flv_sitemap_options");
	
	if (!empty($options)) {
		foreach ($my_options as $key => $option) {
			if (isset($options[$key]))
				$my_options[$key] = $options[$key];
		}
	}
	
	update_option("flv_sitemap_options", $my_options);
	
	return $my_options;
}



/////////////////////////////////////////////////////////////////// admin panel functions

function flv_sitemap_options()
{
	add_options_page('Video Sitemap', 'Video Sitemap', 9, basename(__FILE__), 'flv_sitemap_options_panel');
}

function flv_sitemap_options_panel()
{
	global $flv_sitemap_options;
	
	// test if options should be updated
	if (isset($_POST['options_update'])) {
		$options = explode(',', stripslashes($_POST['page_options']));
		
		if ($options) {
			// retrieve option values from POST variables
			foreach ($options as $option) {
				$option = trim($option);
				$value = trim(stripslashes($_POST[$option]));
				
				// update each sitemap option submitted through POST variables
				if ( ($option == 'server_path') && (!empty($value)) )
					$flv_sitemap_options[$option] = trailingslashit($value);	
				else if ( ($option != 'sitemap_name') || (($option == 'sitemap_name') && (!empty($value))) )
					$flv_sitemap_options[$option] = $value;
			}
			
			// update database option
			if (update_option("flv_sitemap_options", $flv_sitemap_options))
				echo '<div id="message" class="updated fade"><p><strong>Settings saved.</strong></p></div>';
			else
				echo '<div id="message" class="updated fade"><p>No setting was changed since last update.</p></div>';
		} else {
			echo '<div id="message" class="error"><p>No setting value found!</p></div>';
		}
		
	} else if (isset($_POST['sitemap_build'])) {
		$result = flv_sitemap_build();
		
		list($error,$message) = $result;
		
		if (!$error) {
			echo '<div id="message" class="updated fade"><p>' . $message . '</p></div>';
		} else {
			echo '<div id="message" class="error"><p>' . $message . '</p></div>';
		}
		
	} else if (isset($_POST['update_custom_fields'])) {
		$success = flv_update_custom();
		
		if ($success) {
			echo '<div id="message" class="updated fade"><p>Successfully updated custom fields data!</p></div>';
		} else {
			echo '<div id="message" class="error"><p>Custom fields update failed!</p></div>';
		}
	
	} else if (isset($_POST['force_ping'])) {
		$last_ping = flv_ping_google(1);
		
		if ($last_ping == $flv_sitemap_options['last_ping']) {
			echo '<div id="message" class="error"><p>Pinging Google failed!</p></div>';
		} else {
			$flv_sitemap_options['last_ping'] = $last_ping;
			update_option("flv_sitemap_options", $flv_sitemap_options);
			echo '<div id="message" class="updated fade"><p>Google was successfully pinged!</p></div>';
		}
	}
	
	
	// settings used in admin panel
	$options = $flv_sitemap_options;
	$url = get_settings('siteurl') . '/';
	$sitemap = $url . $flv_sitemap_options['sitemap_name'];
	$path = ABSPATH;
	
	
	// checkbox value
	if ($options['allow_embed'])
		$allow_embed_check = 'checked="checked"';
	if ($options['allow_thumbnail'])
		$allow_thumbnail_check = 'checked="checked"';
	if ($options['allow_auto'])
		$allow_auto_check = 'checked="checked"';
	if ($options['allow_duration'])
		$allow_duration_check = 'checked="checked"';
	
	// select box value
	switch($options['family_safe']) {
		case "yes":
			$family_safe_yes = 'selected="selected"';
			break;
		case "no":
			$family_safe_no = 'selected="selected"';
			break;		
		case "not_sure":
			$family_safe_not_sure = 'selected="selected"';
			break;
	}	
	
	// last built
	if (!empty($options['last_built'])) {
		$built = $options['built'];
		//$last_built = date("F d, Y g:i a", $options['last_built']);
		$last_built = flv_time_since($options['last_built']);
		if ($built)
			$status = "Your <a href=\"$sitemap\" title=\"Video Sitemap\">video sitemap</a> was last successfully built $last_built ago.";
		else
			$status = "Your <a href=\"$sitemap\" title=\"Video Sitemap\">video sitemap</a> is <strong style='font-size: 1.2em'>not properly built</strong> and it was last modified $last_built ago.";
	} else {
		$status = "Your video sitemap was never successfully built.";
	}
	
	// last ping
	if (!empty($options['last_ping'])) {
		$last_ping= flv_time_since($options['last_ping']);
		$status .= " Google was last successfully pinged about your sitemap updates $last_ping ago.";
	} else {
		$status .= " Google was never successfully pinged about your sitemap updates.";
	}

print <<< ADMIN_PANEL
<div class="wrap">
	<h2>Video Sitemap Options</h2>
		<form method="post" id="flv_option">

		<h3>Video Sitemap Settings</h3>
			<p>If you see this page, it means sitemap feature is enabled for your <a href="./options-general.php?page=flv-embed.php">FLV Embed</a> plugin.</p>
			
			<table class="form-table">
				<tr>
					<th scope="row">Video sitemap filename</th>
					<td>
						{$url} <input name="sitemap_name" type="text" id="sitemap_name" class="code" value="{$options['sitemap_name']}" size="40" /><br />
						Make sure this file is writable on the server (chmod it "664" or "666")
					</td>
				</tr>
				<tr>
					<th scope="row">Settings</th>
					<td>
						<label for="allow_embed">
						<input name="allow_embed" type="checkbox" id="allow_embed" value="1" {$allow_embed_check} />
						Allow Google to embed your video in the search results on <code>http://video.google.com.</code>
						</label>

						<br />

						<label for="allow_thumbnail">
						<input name="allow_thumbnail" type="checkbox" id="allow_thumbnail" value="1" {$allow_thumbnail_check} />
						Use poster image as thumbnail where applicable. If disabled, Google will automatically generate a set of representative thumbnail images from your actual video content
						</label>

						<br />
						
						<label for="allow_auto">
						<input name="allow_auto" type="checkbox" id="allow_auto" value="1" {$allow_auto_check} />
						Allow FLV Embed to automatically generate new video sitemap everytime a published post with FLV embed tags is updated (may slow down save post process)
						</label>

						<br />
						
						<label for="allow_duration">
						<input name="allow_duration" type="checkbox" id="allow_duration" value="1" {$allow_duration_check} />
						Allow FLV Embed to detect duration of your FLV file when adding custom fields (requires server path below to be configured and may slow down save post process)
						</label>
					</td>
				</tr>
			</table>
			
			<p>For duration detection to work properly, FLV files must be hosted on the same server as your blog. Site relative path to the embedded FLV file will be appended to the server path below when trying to fetch the FLV for duration detection.</p>
			
			<table class="form-table">
				<tr>
					<th scope="row">Server path to site root</th>
					<td>
						<input name="server_path" type="text" id="server_path" class="code" value="{$options['server_path']}" size="40" /><br />
						Hint: server path to your blog root is <code>$path</code>
					</td>
				</tr>
				<tr>
					<th scope="row">Family safe content</th>
					<td>
						<select name="family_safe" id="family_safe">
						<option value="yes" {$family_safe_yes}>Yes</option>
						<option value="no" {$family_safe_no}>No</option>
						<option value="not_sure" {$family_safe_not_sure}>Not all</option>
						</select><br />
						Select "Not all" to disable <code>family_friendly</code> field for sitemap
					</td>
				</tr>
			</table>
		
			<p class="submit">
				<input type="submit" name="options_update" value="Save Changes" />
				<input type="hidden" name="page_options" value="sitemap_name,allow_embed,allow_thumbnail,allow_auto,allow_duration,server_path,family_safe" />
			</p>
		
		&nbsp;
		
		<h3>Build Video Sitemap</h3>
			<p>Clicking the build sitemap button will generate a new video sitemap. {$status}</p>
		
			<p class="submit">
				<input type="submit" name="force_ping" value="Force Ping Now " />
				<input type="submit" name="sitemap_build" value="Build Video Sitemap Now" />
			</p>
		
		&nbsp;
		
		<h3>Update Custom Fields</h3>
			<p>Clicking the following button will insert or update FLV custom field data for all published posts. It might take a while to complete depending on the amount of published posts so far. You should manually rebuild the sitemap once FLV custom fields are updated.</p>
		
			<p class="submit">
				<input type="submit" name="update_custom_fields" value="Update Custom Fields Now" />
			</p>
		
		</form>
</div>
ADMIN_PANEL;

}

// taken from Dunstan's Time Since plugin
function flv_time_since($older_date)
{
	// array of time period chunks
	$chunks = array(
	array(60 * 60 * 24 * 365 , 'year'),
	array(60 * 60 * 24 * 30 , 'month'),
	array(60 * 60 * 24 * 7, 'week'),
	array(60 * 60 * 24 , 'day'),
	array(60 * 60 , 'hour'),
	array(60 , 'minute'),
	);
	
	// $newer_date will equal false if we want to know the time elapsed between a date and the current time
	// $newer_date will have a value if we want to work out time elapsed between two known dates
	$newer_date = time();
	
	// difference in seconds
	$since = $newer_date - $older_date;
	
	// prevent negative time since
	if ($since < 0)
		$since = 0;
	
	// we only want to output two chunks of time here, eg:
	// x years, xx months
	// x days, xx hours
	// so there's only two bits of calculation below:

	// step one: the first chunk
	for ($i = 0, $j = count($chunks); $i < $j; $i++)
		{
		$seconds = $chunks[$i][0];
		$name = $chunks[$i][1];

		// finding the biggest chunk (if the chunk fits, break)
		if (($count = floor($since / $seconds)) != 0)
			{
			break;
			}
		}

	// set output var
	$output = ($count == 1) ? '1 '.$name : "$count {$name}s";

	// step two: the second chunk
	if ($i + 1 < $j)
		{
		$seconds2 = $chunks[$i + 1][0];
		$name2 = $chunks[$i + 1][1];
		
		if (($count2 = floor(($since - ($seconds * $count)) / $seconds2)) != 0)
			{
			// add to output var
			$output .= ($count2 == 1) ? ', 1 '.$name2 : ", $count2 {$name2}s";
			}
		}
	
	return $output;
}



/////////////////////////////////////////////////////////////////// sitemap building functions

function flv_sitemap_build()
{
	global $flv_sitemap_options;
	
	$filename = $flv_sitemap_options['sitemap_name'];
	$xml = ABSPATH . $filename;
	
	// result to be returned is an array of error and message
	$error = 0;
	$message = "";
	
	// open existing sitemap and if not exist, attempt to create one
	$fp = @fopen($xml,"w+");
	
	// test if sitemap exist
	if (!file_exists($xml)) {
		$error = 1;
		$message = "<code>" . $filename . "</code> does not exist and cannot be created!";
	
	// test if sitemap is writable
	} else if (is_writable($xml)) {
		if ($fp == FALSE) {
			$error = 1;
			$message = "<code>" . $filename . "</code> is writable but cannot be opened!";
		}
	} else {
		// try to make sitemap writable by chmod
		if (!@chmod($xml, 0664)) {
			$error = 1;
			$message = "<code>" . $filename . "</code> is not writable!";
		}
	}
	
	// no problem so far?
	if (!$error) {
		$content = flv_sitemap_content();
		if ($content == 'ERROR') {
			$error = 1;
			$message = "No custom field data found!";
		} else {
			if (fwrite($fp, $content) === FALSE) {
				$error = 1;
				$message = "Cannot write to <code>" . $filename . "</code>";
			} else {
				$message = "Video sitemap built successfully!";
			}
		}
	}
	
	// close file if not empty
	if (!empty($fp))
		fclose($fp);
	
	// no error building our sitemap?
	if (!$error) {
		$flv_sitemap_options['built'] = 1;
		$flv_sitemap_options['last_built'] = filemtime($xml);
		$flv_sitemap_options['last_ping'] = flv_ping_google();
	} else {
		$flv_sitemap_options['built'] = 0;
	}
	
	update_option("flv_sitemap_options", $flv_sitemap_options);
	
	$result = array($error,$message);

	return $result;
}

function flv_sitemap_content()
{
	global $wpdb, $flv_sitemap_options, $flv_metakey;
	
	$options = $flv_sitemap_options;
	
	$allow_embed = ($options['allow_embed']) ? "Yes" : "No";
	$player = get_settings('siteurl') . '/wp-content/plugins/flv-embed/flvplayer.swf';
	
	if ($options['allow_thumbnail'])
		$xsl = get_settings('siteurl') . '/wp-content/plugins/flv-embed/sitemap.xsl';
	else
		$xsl = get_settings('siteurl') . '/wp-content/plugins/flv-embed/sitemap2.xsl';
	
	$xml_head = '<?xml version="1.0" encoding="UTF-8"?' . '>';
	$xml_head .= "\n" . '<?xml-stylesheet type="text/xsl" href="' . $xsl . '"?' . '>';
	
	ob_start();
	print <<< XML_HEAD
{$xml_head}
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:video="http://www.google.com/schemas/sitemap-video/1.0">

XML_HEAD;

	// read flv custom fields from database
	$flvs = $wpdb->get_results("SELECT meta_value, id, post_title, post_content, post_excerpt
							FROM $wpdb->postmeta, $wpdb->posts
							WHERE meta_key = '$flv_metakey'
							AND post_id = id
							AND post_status = 'publish'
							ORDER BY post_date DESC");

	// if flv custom fields are found
	if (!empty($flvs)) {
		
		// process each flv found in custom fields
		foreach ($flvs as $flv) {
			$metavalue = $flv->meta_value;
			
			$input = explode("\n", $metavalue);
			$arg = count($input);
			
			// extract movie and poster information
			if ($arg == 1)
				$movie = $input[0];
			else if ($arg == 2)
				list($movie, $poster) = $input;
			else if ($arg == 3)
				list($movie, $poster, $duration) = $input;
			
			// attempt to shorten $movie URL with site relative path for player_loc
			$movie_url = flv_make_relative($movie);
			
			if (!empty($movie_url))
				$player_loc = $player . '?file=' . $movie_url;
			else
				$player_loc = $player . '?file=' . $movie;
			
			$loc = get_permalink($flv->id);
			$title = $flv->post_title;
			
			if (empty($flv->post_excerpt))
				$excerpt = flv_fake_excerpt($flv->post_content);
			else
				$excerpt = $flv->post_excerpt;
			
			// thumbnail
			if ($options['allow_thumbnail'])
				$thumbnail = "\n\t\t<video:thumbnail_loc>" . $poster . "</video:thumbnail_loc>";
			
			// duration
			if ($options['allow_duration']) {
				// convert millisecond to second
				$duration = round($duration / 1000);
				$duration = "\n\t\t<video:duration>" . $duration . "</video:duration>";
			}
			
			// family_friendly
			switch($options['family_safe']) {
				case "yes":
					$family_friendly = "Yes";
					break;
				case "no":
					$family_friendly = "No";
					break;
				case "not_sure":
					$family_friendly = "";
					break;
			}
			
			if (!empty($family_friendly)) {
				$family_friendly = "\n\t\t<video:family_friendly>" . $family_friendly . "</video:family_friendly>";
			}
		
			print <<< ITEM
<url>
	<loc>{$loc}</loc>
	<video:video>
		<video:content_loc>{$movie}</video:content_loc>
		<video:player_loc allow_embed="{$allow_embed}">{$player_loc}</video:player_loc>{$thumbnail}
		<video:title><![CDATA[{$title}]]></video:title>
		<video:description><![CDATA[{$excerpt}]]></video:description>{$family_friendly}{$duration}
	</video:video>
</url>

ITEM;
		}
	} else {
		$error = 'ERROR';
	}

	print <<< XML_FOOT
</urlset>

XML_FOOT;

	$output = ob_get_contents();
	ob_end_clean();
	
	// return error if no flv custom field found
	if ($error)
		return $error;
	else
		return $output;
}

// code borrowed from WordPress function 'wp_trim_excerpt'
function flv_fake_excerpt($content)
{
	$text = $content;
	$text = apply_filters('the_content', $text);
	$text = str_replace(']]>', ']]&gt;', $text);
	$text = strip_tags($text);
	$excerpt_length = 55;
	$words = explode(' ', $text, $excerpt_length + 1);
	if (count($words) > $excerpt_length) {
		array_pop($words);
		array_push($words, '[...]');
		$text = implode(' ', $words);
	}
	return $text;
}


function flv_update_custom()
{
	global $wpdb, $flv_sitemap_options;
	
	// get post id of all published posts
	$posts = $wpdb->get_results("SELECT id
								FROM $wpdb->posts
								WHERE post_status = 'publish'
								AND post_type = 'post'
								ORDER BY post_date ASC");
	
	if (empty($posts)) {
		return false;
	} else {
		// temporarily turn off auto sitemap generation
		$temp = $flv_sitemap_options['allow_auto'];
		$flv_sitemap_options['allow_auto'] = 0;
		
		foreach ($posts as $post) {
			flv_add_meta($post->id);
		}
		
		// retrieve previous option value
		$flv_sitemap_options['allow_auto'] = $temp;
		return true;
	}
}



/////////////////////////////////////////////////////////////////// misc functions

// returns last ping time if no ping, current time if successfully pinged
function flv_ping_google($forced=0)
{
	global $flv_sitemap_options;
	
	$options = $flv_sitemap_options;
	
	$last_ping = $options['last_ping'];
	$now = time();
	
	// number of seconds since last ping
	$since = $now - $last_ping;
	
	// urls
	$url = "http://www.google.com/webmasters/tools/ping?sitemap=";
	$sitemap_url = get_settings('siteurl') . '/' . $options['sitemap_name'];
	$url .= $sitemap_url;
		
	// check if it is a forced ping, last ping is not within an hour and if last ping cannot be found
	if ( ($forced) || ($since >= 3600) || (empty($last_ping)) ) {
		require_once(ABSPATH . 'wp-includes/class-snoopy.php');
		
		$s = new Snoopy();
		$s->fetch($url);
		
		if($s->status == 200)
			return $now;
		else
			return $last_ping;
	} else {
		return $last_ping;
	}
}
?>
