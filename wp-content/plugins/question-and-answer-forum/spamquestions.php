<?php
include_once "Akismet.class.php";
function q_isspam($q)
{
	if(get_option('q_filter_spam')=='TRUE')
	{
		global $current_user;
		get_currentuserinfo();
		$akismet = new Akismet(get_bloginfo('wpurl'),get_option('q_wpcomAPIkey'));
		$akismet->setCommentAuthor($current_user->user_login);
		$akismet->setCommentAuthorEmail($current_user->user_email);
		$akismet->setCommentAuthorURL($current_user->user_url);
		$akismet->setCommentContent($q);
		if($akismet->isCommentSpam())
		{
			return true;
		}
		else{
			return false;
		}
	}
}
?>