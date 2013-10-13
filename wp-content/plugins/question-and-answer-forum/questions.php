<?php
/*
Plugin Name: Question and Answer Forum
Description: Allows users to ask questions which can be answered by the author or other visitors to the site
Author: David Woodford
Version: 2.1.4
Author URI: http://qandaforum.trevorpythag.co.uk

Translations Provided by Yuriy Petrovskiy (Russian), Gabriel Gil http://gabrielgil.es (Spanish)
*/
load_plugin_textdomain( 'qna-forum', false, 'question-and-answer-forum/languages' ); //i18n


include "config.php";			//includes configuration of the plugin
//add_filter("wp_footer","requestbox");
add_action('activate_question/.question.php', 'qinstall');
register_deactivation_hook( __FILE__, 'q_deactivate' );
//add_action('admin_menu', 'bot_admin_actions');
add_action('wp_head','q_header_code');								//adds required scripts to header
//add_action("widgets_init", array('userwidgit', 'register'));		//adds the user login widget
//====================================================question and answers
add_action( 'init', 'create_question_post_type' );
//action to add user post type is in users.php
//add_action( 'wp_print_scripts', 'q_scripts' ); 
add_action('admin_menu', 'qoptions_menu');
register_activation_hook( __FILE__, 'q_activate' );
add_action('wp_print_scripts','enqueue_question_scripts');
add_action('wp_print_styles','enqueue_question_styles');
add_action('wp_set_comment_status','q_newanswer',10,2);
add_action('wp_insert_comment','q_newanswer',10,2);
//mange answer notification emails
include "answeremail.php";
//allow user profiles as posts type
include "qusers.php";
include "ajax-setup.php";


//include "postcomments.php";
global $questionformid;
$questionformid = 0;

function q_activate()
{
	update_option('q_loginrequired_ask','TRUE');
	update_option('q_logintorate','TURE');
	update_option('q_answerratings','FALSE');
	update_option('q_bestans','FALSE');
	update_option('q_bestans_title','<h4>Best Answer</h4>');
	update_option('q_bestans_link','Select as Best Answer');
	update_option('qanda_random_key',qanda_random_string(25));
	//create_question_post_type()
	//flush_rewrite_rules();
}
function q_deactivate(){
	q_delete_quser_pages();
}

function create_question_post_type() {
global $q_question_post_type;
global $q_question_capabilities_tag;
	if($q_question_post_type != "post" && $q_question_post_type != "page"){
		register_post_type($q_question_post_type,
		array(
			'labels' => array(
				'name' => __( 'Questions','qna-forum' ),
				'singular_name' => __( 'Question' ,'qna-forum'),
				'add_new' => __('New Question','qna-forum'),
				'add_new_item' => __('Ask new question','qna-forum'),
				'edit_item' => __('change question','qna-forum'),
				'new_item' => __('new question','qna-forum'),
				'view_item' => __('view question','qna-forum'),
				'search_items' => __('search question','qna-forum'),
				'not_found' => __('No Questions Found','qna-forum'),
				'not_fount_in_trash' => __('No questions found in trash','qna-forum'),
				'menu_name' =>	__('Questions','qna-forum')),
			'public' => true,
			'supports' => array('title','editor','comments','custom-fields'),
			'taxonomies' => array('post_tag', 'category'),
			'rewrite' => array(
				'slug' => 'question',
				'with_front' => false
			),
			'has_archive' => 'question/recent',
			'capability_type' =>  $q_question_capabilities_tag,
		)		
	);
	}
	
/* 	register_taxonomy('question', $object_type, $args);  */
include "statuses.php";
}



function q_header_code()
{
	echo "<script type='text/javascript'>
		var blogurl;blogurl = '" . get_bloginfo('wpurl') . "';
		var qadmim_ajax_url;
		qadmin_ajax_url = '" . admin_url( 'admin-ajax.php' ) . "';
	</script>";
}


function enqueue_question_scripts()
{
	wp_enqueue_script('question_ajax', '/wp-content/plugins/question-and-answer-forum/ajax.js');
}
function enqueue_question_styles()
{
	wp_enqueue_style('question_style','/wp-content/plugins/question-and-answer-forum/style.css',null,'1.0','all');
}
//allow short codes  [question_form]
function question_form($atts,$content = "")
{
	global $questionformid;
	include "askquestionform.php";
	return $html;
}
add_shortcode('question_form','question_form');

//[qarchive_link] params  accepted are author=<user name> or "" for current user and category=<category> 
//first filters by specified user then by category then current user then all questions
function qarchive_link($atts,$content)
{
global $q_question_post_type;
	global $current_user;
	$url = get_bloginfo('wpurl');
	get_currentuserinfo();
	if(isset($atts['author']))
	{
		if(($atts['author'] == "%" )&& (isset($current_user->user_login))){
			$url = $url . "/author/" . $current_user->user_login . "/?post_type=$q_question_post_type";
		}
		else{
			$url = $url . "/author/" . $atts['author'] . "/?post_type=$q_question_post_type";
		}		
	}
	elseif(isset($atts['category']))
	{
		$url = $url . "/category/" . $atts['category'] . "/?post_type=$q_question_post_type";
	}
	else{
/*
		if(get_bloginfo('version')>= "3.1"){
			$url = $url . "/question/recent";
		}
		else{
*/
			$url = $url . "?post_type=$q_question_post_type";
/* 		} */
	}		
	return "<a href='$url'>$content</a>";

}
add_shortcode('qarchive_link','qarchive_link');

include_once "querys.php";
add_shortcode('list_questions','q_list_questions');

//=============================================================================Cat links
add_filter('category_link','question_cat_link');
function question_cat_link($caturl)
{
	global $post;
	global $q_question_post_type;
	if((get_option('q_cat_links')=="TRUE") && ((get_post_type() == $q_question_post_type) || (get_post_meta($post->ID,'section',true)=='questions')) )
	{
		if(strpos($caturl,'?')==false)
		{
			$caturl = "$caturl?post_type=$q_question_post_type";
		}
		else
		{
			$caturl = "$caturl&post_type=$q_question_post_type";
		}
	}
	return $caturl;
}

//=================================================================================BLOG info
function bloginfo_shortcode( $atts ) {
    extract(shortcode_atts(array(
        'key' => '',
    ), $atts));
    return get_bloginfo($key);
}
add_shortcode('bloginfo', 'bloginfo_shortcode');


function qoptions_menu() {

    add_options_page("Question Options", "Q&A Forum","manage_options", "qoptions_page" , "qoptions_page");

}
function qoptions_page()
{
	include "options-page.php";
}

function q_loginform($redirecturl)
{
	$html = "";
	$html = "<form method='post' action='" . get_bloginfo('wpurl') . "/wp-login.php' name='loginform'>";
	$html .= "<p><label>Username</label><br /><input type='text' name='log' class='input' /></p>";
	$html .="<p><label>Password</label><br /><input type='password' name='pwd' class='input' /></p>";
	$html .= "<input type='hidden' name='redirect_to' value='$redirecturl' />";
	$html .= "<input type='hidden' name='testcookie' value='1' />";
	$html .= "<p><input type='submit' name='wp-submit' value='login'</p>";
	$html .= "<a href='" . get_bloginfo('wpurl') . "/wp-signup.php?callback=?&amp;template=default'>Register</a>";
	return $html;
}

//=============================================================================dashboard widget
add_action('wp_dashboard_setup','add_question_db_widget');
function add_question_db_widget()
{
	wp_add_dashboard_widget('question_widget','Recent Questions','q_db_widget');
}
function q_db_widget()
{
	$atts['questions'] = 5;
	echo q_list_questions($atts,"");
}
function q_admin_head() {
	$siteurl = get_bloginfo('wpurl');
	$url = $siteurl . '/wp-content/plugins/question-and-answer-forum/adminstyle.css';
	echo "<link rel='stylesheet' type='text/css' href='$url' />\n";
}
add_action('admin_head', 'q_admin_head');



//=================================================================================Comment Changes
// the script rateanswer.php handles a request to rate an answer use the comment meta table

add_filter('comment_text','q_commfilter',99);
/*function q_show_rate_link($content)
{
	$comment_id = get_comment_ID();
	$currentmeta =get_comment_meta($comment_id,'qans_ratingmeta');
	$meta = explode(":",$currentmeta[0]);
	$rating = $meta[0];
	$number = $meta[1];
	if($rating > 0)
	{
		$ratinghtml = "<span id='comment_rating_" . $comment_id . "'>Average Rating:" . substr($rating,0,3) . "/5 &nbsp; Rate:";
	}
	else{
		$ratinghtml = "<span id='comment_rating_" . $comment_id . "'>No ratings yet &nbsp; Rate:";
	}
	
	for($i=1;$i<6;$i++)
	{
		$ratinghtml = $ratinghtml . "<span class='comment_rate_link_" . $i . "' onclick='rateanswer(" . $comment_id . "," . $i . ",\"comment_rating_" . $comment_id . "\");'>" . $i . "</span>";
	}
	$ratinghtml = $ratinghtml . "</span>";
	$content = $ratinghtml . $content;
	return $content;
	
}*/

function q_commfilter($content)
{
	global $post;
	global $q_bestans;
	global $q_bestans_opt;
	global $bestans_link_text;
	global $q_question_post_type;
	
	if($bestans_link_text == null)											//text that is displayed on the link to choose the best answer
	{
		$bestans_link_textopt = get_option('q_bestans_link');
		if($bestans_link_textopt == null)									//check whether we have checked the database. IF we haven't save the value
		{
			update_option('q_bestans_link','Select as best answer');
			$bestans_link_textopt = 'Select as best answer';	
		}
	}
	if($q_bestans_opt == null)
	{
		$q_bestans_opt = get_option('q_bestans');
	}
	
	//echo $post;
	if(get_post_type($post) == $q_question_post_type && $q_bestans_opt=="TRUE")			//only apply the changes if the post is a question 
	{
	
		if($q_bestans == null){						//calculate the best answer
			$q_bestanss = get_post_meta($post->ID,"q_bestans");
			$q_bestans = $q_bestanss[0];
			if($q_bestans == null ){
				$q_bestans = "none";
			}
		}
		
		global $current_user;						//choose best answer	
		$current_user = wp_get_current_user();
		$bestanswerlink = "";
		if($current_user->ID == $post->post_author)
		{
			if($q_bestans == "none")								//display the link on the answer to allow them to be chosen as the best answer
			{
				$bestanswerlink = "<span id='choosebest" . get_comment_ID() . "' style='text-decoration:underline' onclick='bestans(" . get_comment_ID() .  "," . $post->ID . " , \"choosebest" . get_comment_ID() . "\");'>" . $bestans_link_textopt . "</span><br/>";
			}
		}
		$content = $bestanswerlink . $content;
		
		if($q_bestans == get_comment_ID()){							//allow best answer to be edited
			$content = "<div id='q_bestans' style='" . get_option('q_bestans_styles') . "'>" . get_option("q_bestans_title") . "<br/>" . $content . "</div>";
		}		
	}	
	return $content;	
}

function get_best_ans_id($postid = -1)   //will return the id of the best answer for a given post id if there is one or -1 if there isnt. If the postid is left blank o is -1 will use the current post
{
	global $post;
	global $q_bestans;
	if($postid == -1 || $postid == $post){							//if the user wants to get the best answer of the current post
		if($q_bestans == null){													//first check if we have already looked for the best answer
			$q_bestanss = get_post_meta($post->ID,"q_bestans");
			$q_bestans = $q_bestanss[0];
			if($q_bestans == null ){
				$q_bestans = -1;									//return -1 if the best answer doesnt exist
			}
		}
		return $q_bestans;				
	}
	else															//if it is for a different post we have to look it up in the database
	{
		$q_bestanss = get_post_meta($postid,"q_bestans");
		if(count($q_bestanss) == 0){								//if the array of results is of zero length then it doesnt exist.
			return -1;
		}
		else{
			return $q_bestanss[0];		
		}
	}
}

/*====================================================================Increment answer count          */
function q_newanswer($commentid,$comm = "approve")
{
	global $q_question_post_type;
	$comment = get_comment($commentid);
	$post = get_post($comment->comment_post_ID);	
	if($post->post_type==$q_question_post_type && ($comment->comment_approved == 1)||$comm=="approve"){
		global $current_user;
		if($current_user = wp_get_current_user()){
			if($nomas = get_user_meta($current_user->ID,'q_numas',true)){
				update_user_meta($current_user->ID,'q_numas',$nomas+1);
			}
			else{
				update_user_meta($current_user->ID,'q_numas',1);
			}
			
		}
		
		//===email question author
		$author_email = get_post_meta($comment->comment_post_ID,"email",true);
		//if($author_email != "" && $author_email!=NULL){
			wp_mail($author_email,q_answeremail_subject("",$commentid),q_answeremail_message("",$commentid));
		//}
	}
}

function qanda_random_string($length){
	$chars = '0123456789qwertyuiopasdfghjklzxcvbnm';
	$string = '';
	for($i=0;$i<$length;$i++){
		$string .= $chars[mt_rand(0,35)];
	}
	return $string;
}
?>