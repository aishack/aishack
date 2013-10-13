<?php
/*manages user profiles if enabled. Creates a custom post type quser and then uses a filter so that
 these "posts" can be controled by the plugin to display the user information */
 
 load_plugin_textdomain( 'qna-forum', false, 'question-and-answer-forum/languages' );
 
 add_action( 'init', 'create_quser_post_type' );
 if(get_option('q_qusers')=="TRUE"){
 	add_filter('the_content','q_quserfilter');
}
 add_action('user_register','q_create_profilepage');
 //add_action('delete_user','q_delete_quser_page_byuserid');
 
 
 function create_quser_post_type() {
	register_post_type( 'quser',
		array(
			'labels' => array(
				'name' => __( 'Users' ),
				'singular_name' => __( 'User' ),
				'add_new_item' => __('Add User'),
				'edit_item' => __('Update Profile'),
				'view_item' => __('View Profile')
				),
			'public' => true,
			'show_ui' => FALSE,
			'show_in_menu' =>FALSE,
			'supports' => array('title','editor'),
			//'taxonomies' => array( 'post_tag','category'),			No taxonomys for now though may be used to allow groups to be created or different levels of user
			'rewrite' => array(
							'slug' => 'question-users',
							'with_front' => flase
							),
			'has_archive' => 'question-users'
			)		
		);
}

function q_generate_quser_pages()					//when user profiles is activated loop through all users and create a profile page
{
	$errormessage = "All Users: ";
	$qusers = get_users_of_blog();
	foreach($qusers as $quser){
		$userpost = array(
		    'post_title' => $quser->display_name,
		     'post_content' => $quser->user_description,
		     'post_status' => 'publish',
		     'post_author' => $quser->ID,
		     'post_date' =>$quser->registered,
			 'post_type' => 'quser'			
		);
		$postid = wp_insert_post($userpost);
		if(!$postid){
			$errormessage .= __("error with user",'qna-forum') . " " . $quser->ID;
		}
		else{
			update_user_meta($quser->ID,'q_profilepage_id',$postid);
		}
	}	
															//create default page with author -1 so that we can display a homepage or login page
	$default_post = array(
				'post_title' => 'My Account',
				'post_content' => 'Default User',
				'post_status' => 'publish',
				'post_author' => 1,
				'post_type' => 'quser'
			);
	$default_id = wp_insert_post($default_post);
	if(!$default_id){
		$errormessage .= __("error creating default page",'qna-forum');
	}
	else{
		update_option('q_quser_default_pageid',$default_id);
	}
	return $erromessage;
}
//==========================================================delete a users profile page if they are deleted
function q_delete_quser_pages($quserid=-1){
	if($quserid=-1){
		wp_delete_post($quserid,TRUE);
	}
	else{
			$quses = get_posts(array('post_type'=>'quser','numberposts'=>-1,'post_status'=>'any'));
			foreach ($quses as $quser){
				wp_delete_post($quser->ID,TRUE);
			}
	}
}
											//=========================================== create indiviual user porilfe page (is called by action user_register)
function q_create_profilepage($userid){
		$quser = get_userdata($userid);
		$userpost = array(
		    'post_title' => $quser->display_name,
		     'post_content' => $quser->user_description,
		     'post_status' => 'publish',
		     'post_author' => $quser->ID,
		     'post_date' =>$quser->registered,
			 'post_type' => 'quser'			
		);
		$postid = wp_insert_post($userpost);
		update_user_meta($userid,'q_profilepage_id',$postid);	
}

		//=============================================================Controls what is displayed on the user profile page
		//post author is the user whose profile we want to display- if the author Id is 0 then we either wanto] display the current user or a login form 
function q_quserfilter($content){
	global $current_user;
	global $post;
	global $wpdb;
	if($post->post_type != "quser"){
		return $content;
	}
	
	$content = "";
	if(isset($_GET['mess']) && ($_GET['mess']=='Registered')){							//display message to the user
			$content = "<p class='quser-message'>" . __('A password has been emailed to you','qna-forum') . "</p>";
	}
	elseif(isset($_GET['mess']) && ($_GET['mess']=='PasswordsDontMatch')){
		$content = "<p class='quser-message'>" . __('Your passwords dont match','qna-forum') . "</p>";
	}
	elseif(isset($_GET['mess']) && ($_GET['mess']=='ProfileUpdated')){
		$content = "<p class='quser-message'>" . __('Profile Updated','qna-forum') . "</p>";
	}
	
													//display for a logged in user
	get_currentuserinfo();
	if($post->post_author == 1 && !is_user_logged_in() && get_option('q_registration_page') == 'TRUE' && get_option('q_quser_default_pageid')==$post->ID){				//Default page with no user means we need login/registration page

		$content .= "<h3>" . __('Login','qna-forum') . "</h3>" . wp_login_form(array('echo'=>false)) . "<p>" . "<a href='" . wp_lostpassword_url("","",false) ."'>" . __('Lost your password?','qna-forum') . "</a>";		
		$content .= "<h3>" . __('Register','qna-forum') . "</h3>" . q_register_form(get_permalink(get_option('q_quser_default_pageid')) . "?mess=" . 'Registered');
		return $content;
	}
	elseif($post->post_author == 1 && get_option('q_quser_default_pageid')==$post->ID){
		$post->post_author = $current_user->ID;
	}	
	$quser = get_userdata($post->post_author);
																		//Display the user profile page
	$q_bestans = get_option('q_bestans');								//create a table with number of question, answers and best answers
	if($q_bestans == "TRUE"){
		$tdclass = "class='three-cols' style='width:83px;padding:3px 0;text-align:center;margin:0;'";
	}else{
		$tdclass= "class='two-cols' style='width:125px;padding:3px 0;text-align:center;margin:0;'";
	}
	$qatable = "<table class='quser-bestans'><tr><td $tdclass>" . __('Questions','qna-forum') . "</td><td $tdclass>" . __('Answers','qna-forum') . "</td>";

	
	if($q_bestans == "TRUE"){
		$qatable .= "<td $tdclass>" . __('Best Answer','qna-forum') . "</td></tr>";
	}
	else{
		$qatable .= "</tr>";
	}
	
	$qatable .= "<tr><td $tdclass>" . get_user_meta($post->post_author,'q_numqs',true) . "</td><td $tdclass>" . get_user_meta($post->post_author,'q_numas',true) . "</td>";
	
	if($q_bestans == "TRUE"){
		$qatable .= "<td $tdclass>" . get_user_meta($post->post_author,'q_numbestas',true) . "</td></tr></table>";
	}
	else{
		$qatable .= "</tr></table>";
	}
	
	//Profile Decription - display in a paragraph if another user and allow editing if it is the current user
	if($current_user->ID == $post->post_author)		//current user
	{												//=======================================display editing form (note the inside of the html is repeated in quser-update.php)
		$desc = "";	
		$desc .= "<p><a href='" . wp_logout_url() . "'>" . __('Logout','qna-forum') . "</a></p> 
		
			<form class='quser-editdetails' id='quser_update_form' method='post' action='javascript:quser_update(\"quser_update_form\");'>
			" .  q_quser_update_form($quser->description,"") ."
				</form>";	
	}
	else{
		$desc = "<p>" . get_user_meta($post->post_author,'description',TRUE) . "</p>";
	}	

	//Query Sections
	$atts['questions'] = 5;
	$atts['author'] = $post->post_author;
	$qquery = q_list_questions($atts,"");
	
	$content .= "<div style='float:left;margin-right:20px'><div>" . get_avatar($quser->user_email, $size = '250', $default='' ) . "</div>";
	$content .= "<p><a href='http://en.gravatar.com/emails/'>" . __('Get or Change your Gravatar','qna-forum') . "</a></p>";
	$content .= $qatable . "</div>";
	$content .= "<div id='quser-desc'><h3>" . __('About','qna-forum') . " " . $quser->display_name . "</h3>" . $desc . "</div>";
	$content .= "<h3 style='clear:both;margin-top:30px;'>" . __('My Recent Questions','qna-forum') . "</h3>";
	$content .= $qquery;

	return $content;
}


//========================================================================================Manage Profile Page links
add_filter('author_link','q_author_profile_link',10,3);
add_filter('get_comment_author_url','q_comm_reply_link',10,4);
add_filter('the_author','q_the_author',10,1);		//doesn't display profile page link but allows the name of the author  of a question to be displayed when they aren't a registered user
add_filter('the_author_posts_link','q_the_author',10,1);	//same as above
function q_author_profile_link($linkurl,$id,$nicename)
{
	global $post;
	global $q_question_post_type;
	if(get_option('q_postauthor_quser_link') == 'TRUE'){
		return get_permalink(get_user_meta($id,"q_profilepage_id",TRUE));
	}
	elseif(get_option('questionauthor_quser_link') == 'TRUE' && $post->post_type == $q_question_post_type ){
		return get_permalink(q_user_meta($id,'q_profilepage_id',TRUE));
	}
	else{
		return $linkurl;
	}
}

function q_comm_reply_link($linkurl){
global $post;
global $comment;
global $q_question_post_type;
	if(isset($post) && $post->post_type == $q_question_post_type && get_option('q_answerauthor_quser_link') == "TRUE" && isset($comment) ){
		return get_permalink(get_user_meta($comment->user_id,"q_profilepage_id",TRUE));	
	}
	elseif($post->post_type == $q_question_post_type && get_option('q_commentauthor_quser_link') == "TRUE" && isset($comment->user_id)){
		return get_permalink(get_user_meta($comment->user_id,"q_profilepage_id",TRUE));
	}
	else{
		return $linkurl;
	}
}


function q_the_author($name){			//if the user wasn't logged in when they asked a question display the name that is stored in the meta
	global $post;
	global $q_question_post_type;
	if($post && $post->post_type==$q_question_post_type && $post->post_author==0 && $newname=get_post_meta($post->ID,"name",TRUE)){
		return $newname;
	}
	else{
		return $name;
	}
}

//===================================================================================register form
function q_register_form($redirecturl){
	return '<form name="registerform" id="registerform" action="http://127.0.0.1/wp/3.0/wordpress/wp-login.php?action=register" method="post"> 
		<p> 
			<label>Username
			<input type="text" name="user_login" id="user_login" class="input" value="" size="20" /></label> 
		</p> 
		<p> 
			<label>E-mail
			<input type="text" name="user_email" id="user_email" class="input" value="" size="25" /></label> 
		</p> 
		<p id="reg_passmail">A password will be e-mailed to you.</p> 
		<br class="clear" /> 
		<input type="hidden" name="redirect_to" value="' . $redirecturl . '" /> 
		<p class="submit"><input type="submit" name="wp-submit" id="wp-submit" class="button-primary" value="Register" tabindex="100" /></p> 
	</form> ';
}

function q_quser_update_form($desc,$mess){
	$q_quser_update_nonce = wp_create_nonce( 'q_quser_update_nonce' );
	$html = ""; 
	if(isset($mess) && $mess!=null && $mess != ""){
		$html = "<p class='quser-message'>$mess</p>";
	}
	$html = $html . "<p>Provide a brief description of yourself</p>
		<textarea id='desc' name='desc' style='width:200px;height:150px;'>" . $desc . "</textarea> 
		<p>New Password<br/><input type='password' name='password' style='width:200px'>
		<br/>Repeat Password<br/><input type='password' name='newpassword' style='width:200px'>
		</p>
		<input type='hidden' value='q_quser_update' name='action' />
		<input type='hidden' value='$q_quser_update_nonce' name='nonce' />
		<input type='submit' name='q_editprofile' value='Update' />";
	return $html;
}

?>