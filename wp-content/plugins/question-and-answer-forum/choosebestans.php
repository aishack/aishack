<?php
	//require_once("../../../wp-config.php");		//enable to use wp objects and functions
	load_plugin_textdomain( 'qna-forum', false, 'question-and-answer-forum/languages' ); //i18n
	global $wpdb;
	global $current_user;	
	$current_user = wp_get_current_user();
	
	$post = get_post($_GET['post']);
	if($current_user->ID != $post->post_author){
		echo "error:login as question author";
		return;
	}
	
	if(get_post_meta($_GET['post'],"q_bestans") != null){
		echo "error:best answer already chosen";
		return;
	}
	
	if(update_post_meta($_GET['post'],"q_bestans",$_GET['comment']))
	{
		echo __("Chosen as best answer",'qna-forum');
		
		//update the best answer count========================================
		if($nomqs = get_user_meta($current_user->ID,'q_numbestas',single)){
			update_user_meta($current_user->ID,'q_numbestas',$nomqs+1);
		}
		else{
			update_user_meta($current_user->ID,'q_numbestas',1);
		}
				
	}
	else{
		echo "error: unknown error occured";
	}
	
?>