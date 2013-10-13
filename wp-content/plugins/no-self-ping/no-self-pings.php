<?php
/*
Plugin Name: No Self Pings
Plugin URI: http://blogwaffe.com/2006/10/04/421/
Description: Keeps WordPress from sending pings to your own site.
Version: 0.2
Author: Michael D. Adams
Author URI: http://blogwaffe.com/

License: GPL2 - http://www.gnu.org/licenses/gpl.txt
*/

function no_self_ping( &$links ) {
	$home = get_option( 'home' );
	foreach ( $links as $l => $link )
		if ( 0 === strpos( $link, $home ) )
			unset($links[$l]);
}

add_action( 'pre_ping', 'no_self_ping' );
?>
