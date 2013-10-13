<?php
/*
Plugin Name: Visual Code Editor
Plugin URI: http://www.webveteran.com/blog/index.php/visual-code-editor/
Description: Makes it possible (and trouble free) to post and edit syntax (programming code snippets) in wordpress's visual editor. Requires WordPress 2.5 - 2.9.2 * Adds &lt;pre&gt; &amp; &lt;code&gt; to block format menu. * Allows extra attributes for compatibility in some syntax highlighters (ie, &lt;pre lang="php" line='5'&gt;). * Allows iFrames. * Unescape WP's double escaping of &amp;amp;. * Removes extra  &lt;pre&gt; tags around SyntaxHighllighter Plus's [sourcecode] blocks. * Works in comments.
Version: 1.2.5
Author: Jules Gravinese
Author URI:  http://www.webveteran.com/

Released under GNU General Public License, version 2.
*/

function smartenTinyMCE($init) {
	// Add PRE and CODE to the block formats menu
	$init['theme_advanced_blockformats'] = 'p,h1,h2,h3,h4,h5,h6,pre,code';
		
	// Allow extra attributes for some syntax highlighters, IE: <pre lang="php" line="5">...</pre)
	// Allow iFrames for live examples
	$init['extended_valid_elements'] = 'pre[*],code[*],iframe[*]';

	return $init;
}


function fixAmps($post_content = '') {
	return preg_replace("/&amp;amp/i", "&amp", $post_content);
}


function removePrePost($post_content = '') {
	$preStart = '<pre>\n<pre class="syntax-highlight:';
	$preEnd = addcslashes('</pre>\n</pre>', '/');
	$post_content = preg_replace("/$preStart/i", '<pre class="syntax-highlight:', $post_content);
	return preg_replace("/$preEnd/i", '</pre>', $post_content);
}
function removePreComment($comment = '') {
	$preStart = addcslashes('<pre><pre class="syntax-highlight:', '/');
	$preEnd = addcslashes('</pre>\n</pre>', '/');
	$comment = preg_replace("/$preStart/i", '<pre class="syntax-highlight:', $comment);
	return preg_replace("/$preEnd/i", '</pre>', $comment);
}



// Modify Tiny_MCE init
add_filter('tiny_mce_before_init', 'smartenTinyMCE' );

// Unescape WP's double escaping of '&'
add_filter('the_editor_content', 'fixAmps');

// Remove extra PRE tag around [sourcecode] blocks in posts
add_filter('the_content', 'removePrePost');

// Remove extra PRE tag around [sourcecode] blocks in comments
add_filter('comment_text', 'removePreComment');

?>