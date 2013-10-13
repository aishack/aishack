<?php
/*
Plugin Name: WP Greet Box
Plugin URI: http://omninoggin.com/projects/wordpress-plugins/wp-greet-box-wordpress-plugin/
Description: Show a different message to your visitor depending on which site they are coming from.  For example, you can ask Digg visitors to Digg your post, Google visitors to subscribe to your RSS feed, and more!  Best of all, this plugin is compatible with various WordPress cache plugins.
Version: 6.4.0
Author: Thaya Kareeson
Author URI: http://omninoggin.com/
*/

/*
Copyright 2008-2011 Thaya Kareeson (email : thaya.kareeson@gmail.com)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

require_once(dirname(__FILE__).'/includes/wp-greet-box.class.php');
$wpgb = new WPGreetBox();

function wpgb_has_greet_message() {
  global $wpgb;
  if ($wpgb) return $wpgb->has_greet_message();
}

// function used for manually insertion
function wp_greet_box() {
  global $wpgb;
  if ($wpgb) $wpgb->display();
}
?>
