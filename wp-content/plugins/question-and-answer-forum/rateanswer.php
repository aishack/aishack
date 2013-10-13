<?php
	require_once("../../../wp-config.php");		//enable to use wp objects and functions
	global $wpdb;
	global $current_user;	
	$current_user = wp_get_current_user();
	
	if(get_option('q_answerratings') != "TURE" )				//check ratings are allowed
	{
		return;	
	}

	if((get_option('q_logintorate')== "TRUE") && !is_user_logged_in())			//currently this will always be true as a method of only allowing someone to rate once
	{
		echo "use must login to rate an answer";				//check whether user has permission to rate
		return;
	}
	
	$rated_comments = get_user_meta($current_user->ID,'q_ratedanswers');
	if(strpos($rated_comments,$_GET['comment_id'])>0){
		echo "youve already rated this comment";
		return;
	}
	
	try{
		$result = rate_comment($_GET['comment_id'],$_GET['rating']);		
		update_user_meta($current_user->ID,'q_ratedanswers' , $rated_comments . "," . $_GET['comment_id'] . ":" . $_GET['rating']);
		echo $result;
	}
	catch(Exception $e)
	{
		echo "Rating comment failed: please try again later";
		return;
	}		

	function rate_comment($comment_id,$rating)					//function to update the meta data for the comment
	{
		$rating = substr(trim($rating),0,1);
		$metastring = get_comment_meta($comment_id,'qans_ratingmeta');		//use a string <averagerating>:<#ofratings>
		$metadata = explode(":", $metastring[0]);
		
		if($metadata[1] == 0)
		{
			$metastring = $rating . ":1";
			$newrating = $rating;
		}
		else
		{
			$newrating = ($metadata[0]*$metadata[1] + $rating)/($metadata[1]+1);	
			$metadata[1]++;
			$metastring = $newrating . ":" . $metadata[1];
		}
		update_comment_meta($comment_id,'qans_ratingmeta',$metastring);		//update the database		

		$ratinghtml = "Average Rating:" . substr($newrating,0,3) . "/5 &nbsp; Your rating: " . $rating . "/5";
		return $ratinghtml;								//return the string
	}
?>