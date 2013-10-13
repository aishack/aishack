<?php
	if (defined('ABSPATH') && defined('WP_UNINSTALL_PLUGIN') 
	&& strtolower(WP_UNINSTALL_PLUGIN) === 'popular-posts-plugin/popular-posts.php') {
		delete_option('popular-posts');
		delete_option('widget_rrm_popular_posts');
	}
?>