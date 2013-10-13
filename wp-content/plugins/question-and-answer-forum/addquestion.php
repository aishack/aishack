<?php
//require_once("../../../wp-config.php");		//enable to use wp objects and functions
global $wpdb;
global $q_question_post_type;
load_plugin_textdomain( 'qna-forum', false, 'question-and-answer-forum/languages' );
include_once("spamquestions.php");
$errormess = "";

if ( ! wp_verify_nonce( $_POST['nonce'], 'q_question_form' ) ){				//check nonces
	echo "<p class='quser-message'>Error - refresh the page and try again</p>";
	die;
}

if(!is_user_logged_in() &&(get_option('q_loginrequired_ask')=='TRUE'))				//check user is logged in
{
	echo __('You must be logged in to ask a question','qna-forum');
	return;
}
if(get_option('q_cat_' . $_POST['category']) != "TRUE"){
	$errormess .= __('Invalid category - the category must be chosed from the drop down list','qna-forum');
}

$errormess = '';
if(!is_user_logged_in() &&(get_option('q_loginrequired_ask')=='name-and-email'))			//check name and email if required
{
	if($_POST['name'] ==  __("Enter Your Name", 'qna-forum') || $_POST['name'] ==""){
		$errormess .= __('You must enter a name','qna-forum').'<br/>';
	}
	if($_POST['email'] ==__("Enter Your Email Address",'qna-forum') || $_POST['email'] ==""){
		$errormess .= __('You must enter an email address','qna-forum').'<br/>';
	}
}

if($_POST['title'] == __('Enter Question Title','qna-forum') || $_POST['title'] == ""){
	$errormess .= __('You must add a question title','qna-forum').'<br/>';
}
if($_POST['question'] == __('Enter Your Question Here','qna-forum') || $_POST['question'] == ""){
	$errormess .=__('You must add a question','qna-forum').'<br/>';
}

if($errormess != ""){										//for basic validation
	echo "<div class='qerror'>$errormess</div>";
		if(($_POST['name'] == __('Enter Your Name','qna-forum')) || $_POST['name'] == "")   //if either of the title of main question are left blank reset
		{
			$qname = __('Enter Your Name','qna-forum');
		}
		else{
			$qname = esc_attr($_POST['name']);
		}
		if(($_POST['email'] == __('Enter Your Email','qna-forum')) || $_POST['email'] == "")   //if either of the title of main question are left blank reset
		{
			$qemail = __('Enter Your Email','qna-forum');
		}
		else{
			$qemail = esc_attr($_POST['email']);
		}
		if(($_POST['title'] == __('Enter Question Title','qna-forum')) || $_POST['title'] == "")   //if either of the title of main question are left blank reset
		{
			$qtitle = __('Enter Question Title','qna-forum');
		}
		else{
			$qtitle = esc_attr($_POST['title']);
		}
		if($_POST['question'] == __('Enter Your Question Here','qna-forum') || $_POST['question'] == "")
		{
			$Qtext = __('Enter Your Question Here','qna-forum');
		}
		else{
			$Qtext = esc_textarea($_POST['question']);
		}
	include_once "coreform.php";						// include the form so the user can try again
	echo $html;
}
else
{
		$newquestion = array(
			'post_title' => htmlentities($_POST['title'],ENT_QUOTES,'UTF-8'),
			'post_content' => str_replace('[','&#91;',str_replace(']','&#93;',htmlentities($_POST['question'],ENT_QUOTES,'UTF-8'))),
			'post_status' => 'pending',													///STATUS CHANGED TO PENDING
			'post_type' => $q_question_post_type,
			'comment_status' => 'open',
			'post_category' => array($_POST['category']),
		);
		
		//new question status
		if(get_option("qanda_hold_q_4_moderation") == "FALSE"){
			$newquestion['post_status'] = 'publish';
		}
		

		
		if(q_isspam($newquestion)) {
			$newquestion['post_status'] = 'spam';
			$qmessage = "<br />".__('Question awaiting moderation','qna-forum');
		} else {
			$qmessage = "";
		}
		
		$newpost = wp_insert_post($newquestion);
		if($newpost == 0) {
			echo __('error occured in asking question','qna-forum');
		} else {
			if(!is_user_logged_in() &&(get_option('q_loginrequired_ask')=='name-and-email'))
			{
				add_post_meta($newpost, 'name', htmlentities($_POST['name'],ENT_QUOTES,'UTF-8'), true);
				add_post_meta($newpost, 'email', htmlentities($_POST['email'],ENT_QUOTES,'UTF-8'), true);
			}
			$plink = get_permalink($newpost);
			if($newquestion['post_status'] == 'publish'){
				echo __('Question added successfuly','qna-forum'). $qmessage . "<P><a href='" . $plink . "'>" . $plink . "</a>";
				$emailcontent = __('A new question has been asked, answer it by visiting ','qna-forum') . $plink . "." . __('The question is:','qna-forum') . htmlentities($_POST['question'],ENT_QUOTES,'UTF-8');
			}
			elseif($newquestion['post_status'] == 'pending'){
				echo "<p>" . __("Your question is awaiting moderation",'qna-forum') . "</p><p>" . __('If approved you can view answers at ','qna-forum') . "<br><a href='" . $plink . "'>" . $plink . "</a></p>"; 
				$emailcontent = __("A new question has been held for moderation. To approve or reject it go to",'qna-forum') . get_bloginfo('wpurl') . "/wp-admin/edit.php?post_type=$q_question_post_type
Question Title: " . $newquestion['post_title'] . "
Question:
" . $newquestion['post_content'];


			}
			if(get_option('q_email_admin') == 'TRUE')
			{
				wp_mail(get_bloginfo('admin_email'),get_bloginfo('name') . ": New Question" . htmlentities($_POST['title'],ENT_QUOTES,'UTF-8') ,$emailcontent);
			}
		}
}
?>