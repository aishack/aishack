<?php
//==============================================================================	SEND EMAIL NOTIFICATIONS
add_filter('comment_notification_text','q_answeremail_message',10,2);
add_filter('comment_notification_subject','q_answeremail_subject',10,2);
function q_answeremail_message($message,$comment_id)
{
 	global $q_question_post_type;
	$comment = get_comment($comment_id);
	$commentpost = get_post($comment->comment_post_ID);

	if($commentpost->post_type == $q_question_post_type)
	{
		$vars = array('%BLOGURL%','%QUESTIONTITLE%','%QUESTION%','%ANSWER','%AUTHOR');
		$vals = array(get_bloginfo('wp_url'),$commentpost->post_title,$commentpost->post_content,$comment->comment_content,$comment->comment_author);
		$message = str_replace($vars,$vals,get_option('answer_email_content'));	
		$message .= "
	
To stop reciveing email notifications for answers to your question please visit " . get_bloginfo('wp_url') . "?action=qanda_cancel_answer_email_notifications&email=" . get_post_meta($commentpost->ID,'email') . '&qanda_auth=' . urlencode(md5(get_post_meta($commentpost->ID,'email') . get_option('qanda_random_key'))) . "
If you have a log in account you may also need to disable it.";
	}
	return $message;
	
}
function q_answeremail_subject($subject,$comment_id)
{
	global $q_question_post_type;
	$comment = get_comment($comment_id);
	$commentpost = get_post($comment->comment_post_ID);
	if($commentpost->post_type == $q_question_post_type)
	{
		$vars = array('%BLOGURL%','%QUESTIONTITLE%','%QUESTION%','%ANSWER','%AUTHOR');
		$vals = array(get_bloginfo('wp_url'),$commentpost->post_title,$commentpost->post_content,$comment->comment_content,$comment->comment_author);
		$emailsubject = str_replace($vars,$vals,get_option('answer_email_subject'));
	}
	return $emailsubject;	
}

//==========================================================================	CANCEL EMAIL NOTIFICATIONS
add_action('wp_ajax_qanda_cancel_answer_email_notifications','qanda_cancel_answer_email_notifications');
function qanda_cancel_answer_email_notifications(){
	global $q_question_post_type;
	if(urlencode(md5($_GET['email'] . get_option('qanda_random_key'))) != $_GET['qanda_auth']){
		?><div>
			<h1>Authorisation Failed</h1>
			<p>The address you entered to end the email subscription is incorrect. If you are the owner of the email address for which you wish to end the email subscription please contact the site administrator.</p>
		</div><?php		
	}
	
	$posts = get_posts(array(
			'numberposts'  =>  -1,
			'post_type'    =>  $q_question_post_type,
			'post_status'  =>  'publish',
			'email'        =>  $_GET['email']
		));
	foreach($posts as $p){
		update_post_meta($p->ID,'email','',$_GET['email']);
	}
	
	?>
		<div>
			<h1>New answer email subsciption cancelled</h1>
			<p>You will no longer recieve emails to the address <?php echo $_GET['email']; ?> to notify you of new answers posted on questions asked using your email address.</p>
		</div>
	<?php
	
	exit;
}