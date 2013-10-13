<?php
load_plugin_textdomain( 'qna-forum', false, 'question-and-answer-forum/languages' ); //i18n
add_filter("post_row_actions","qanda_question_edit_row_action",10,2);		//add extra actions in row table in admin
add_action( 'admin_init', 'qanda_publish_question_action' );				//allow actions on row table in admin to be executed
add_filter('display_post_states','qanda_post_states');						//display spam next to title in admin table
add_filter('wp_insert_post_data','qanda_poststates_author_filter',10,2);	//used to keep the post athour as the one sent

					// Create the status spam for questions
register_post_status( 'spam', array(
	'label'       => __( 'spam', 'qna-forum'),
	'protected'   => true,
	'label_count' => _n_noop( 'Spam <span class="count">(%s)</span>', 'Spamed <span class="count">(%s)</span>' ),
) );


//=============================================================
												//change links in the rows of edit page
function qanda_question_edit_row_action($actions, $post){		
global $q_question_post_type;												
	if($post->post_type != $q_question_post_type){			//check post is a question
		return $actions;
	}
						//Approve link for pending questions
	if ( current_user_can( "publish_posts", $post->ID ) && ($post->post_status != "publish")) {
		$actions['Approve'] = "<a title='" . esc_attr( __( 'Approve this question','qna-forum' ) ) . "' href='http://" . $_SERVER["HTTP_HOST"] . $_SERVER["REQUEST_URI"]  . "&qpub_nonce=" . wp_create_nonce( 'q_question_pub' ) . "&qpub_postid=" . $post->ID ."&qaction=pub" . "'>" . __( 'Approve','qna-forum' ) . "</a>";
	}	
						//spam link for published or pending questions
	if ( current_user_can( "publish_posts", $post->ID ) && (($post->post_status != "spam")||($post->post_status == "publish"))) {
		$actions['Spam'] = "<a title='" . esc_attr( __( 'Mark as spam','qna-forum' ) ) . "' href='http://" . $_SERVER["HTTP_HOST"] . $_SERVER["REQUEST_URI"]  . "&qspam_nonce=" . wp_create_nonce( 'q_question_pub' ) . "&qpub_postid=" . $post->ID ."&qaction=spam" . "'>" . __( 'Spam','qna-forum' ) . "</a>";
	}			
	
						//change view to answer
	$post_type_object = get_post_type_object( $post->post_type );
	if ( $post_type_object->publicly_queryable ) {
		if ( in_array( $post->post_status, array( 'pending', 'draft' ) ) ) {
			if ( $can_edit_post )
				$actions['view'] = '<a href="' . esc_url( add_query_arg( 'preview', 'true', get_permalink( $post->ID ) ) ) . '" title="' . esc_attr( sprintf( __( 'Preview &#8220;%s&#8221;' ), $title ) ) . '" rel="permalink">' . __( 'Preview' ) . '</a>';
		} elseif ( 'trash' != $post->post_status ) {
			$actions['view'] = '<a href="' . get_permalink( $post->ID ) . '" title="' . esc_attr( sprintf( __( 'View and Answer &#8220;%s&#8221;','qna-forum' ), $title ) ) . '" rel="permalink">' . __( 'Answer','qna-forum' ) . '</a>';
		}
	}
	
	return $actions;
}


						//allow publishing from edit rows
function qanda_publish_question_action(){
	if($_GET['qaction'] == "pub")				//publish questions
	{
		$q = get_post($_GET['qpub_postid']);
		if(!($q->post_type == "question"))
		{
			return;
		}
		if(!current_user_can( "publish_posts", $q->ID )){
			echo "you cant do that";
			return;
		}
		if(!wp_verify_nonce( $_GET['qpub_nonce'], 'q_question_pub') ){
			echo "you need a nonce";
			return;
		}
			
		$uq = array();
		$uq['ID'] = $q->ID;
		$uq['post_status'] = "publish";
		$uq['post_author'] = $q->post_author;
		global $qanda_act;
		$qanda_act = "q_change_question_status";			//allows 'qanda_poststates_author_filter' to reset the author to the one passed
		
		wp_update_post($uq);
		
		if(wp_update_post($uq)){
			add_action('all_admin_notices','qanda_notices_set_as_publish');
		}
		else{
			echo "fail";
		}
		
	}
	elseif($_GET['qaction'] == "spam")						//spam question
	{
		$q = get_post($_GET['qpub_postid']);
		if(!($q->post_type == "question"))
		{
			return;
		}
		if(!current_user_can( "delete_posts", $q->ID )){
			echo "you cant do that";
			return;
		}
		if(!wp_verify_nonce( $_GET['qspam_nonce'], 'q_question_pub') ){
			echo "you need a nonce";
			return;
		}
			
		$uq = array();
		$uq['ID'] = $q->ID;
		$uq['post_status'] = "spam";
		$uq['post_author'] = $q->post_author;
		global $qanda_act;
		$qanda_act = "q_change_question_status";			//allows 'qanda_poststates_author_filter' to reset the author to the one passed
		if(wp_update_post($uq)){
			add_action('all_admin_notices','qanda_notices_set_as_spam');
		}
		else{
			add_action('all_admin_notices','qanda_notices_status_failed');
		}
		
	}
}

			//called by _post_states, passed array of the states to be added next to title in row. Also sets gloabl mode to display excrept
function qanda_post_states($post_states){
	global $q_question_post_type;
	global $post, $mode;
	if(!($post->post_type == $q_question_post_type))
	{
		return;
	}
	if($_GET['mode'] != "list"){
		$mode = "excerpt";								//IMPORTANT --- SET MODE TO EXCERPT SO THAT QUESTION EXCERPTS WILL BE SHOWN
	}
	
	if(($post->post_status == "spam") && ("spam" != $_GET['post_status']))		//add spam notice
	{
		$post_states['spam'] = __('Spam','qna-forum');
	}
	
	return $post_states;
}

function qanda_poststates_author_filter($data, $postarr){					//allows the post author remain the same when using wp_update post
		/*this function is needed because wp_update_post calls wp_insert_post to enter the data into the database
		. wp_insert_post automatically sets post_author to the current user regardless of the value passed to it. 
		This function filters the data to be entered into the post after wp_insert_post makes this change. We add
		 an extra field to the array so that the function knows when to make the change.*/
	global $qanda_act;
	global $q_question_post_type;
	if($data['post_type'] == $q_question_post_type && $qanda_act=="q_change_question_status"){
		$data['post_author'] = $postarr['post_author'];
	}
	return $data;
}


//===============================================================================================admin notices used
function qanda_notices_set_as_spam(){
	echo "<div class='updated'><p>Question marked as spam</p></div>";
}
function qanda_notices_set_as_publish(){
	echo "<div class='updated'><p>Question published</p></div>";
}
function qanda_notices_status_failed(){
	echo "<div class='updated'><p>Question status update failed</p></div>";
}
?>