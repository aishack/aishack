<?php
//===================================================User Posts List
load_plugin_textdomain( 'qna-forum', false, 'question-and-answer-forum/languages' );

function q_list_questions($atts,$content)
{
	global $q_question_post_type;
	$performquery = true;					//allows query to be avoided in certian cases
											//set up parameters for the query
	$args['post_type'] = $q_question_post_type;
	$args['post_status'] = 'publish';
	
	if(isset($atts['author']))
	{
		if($atts['author'] == "%" && is_user_logged_in())			//% symbol used to indicate current user
		{
			global $current_user;
			get_currentuserinfo();
			$args['author'] = $current_user->ID;
		}
		elseif($atts['author'] != "%")
		{
			$args['author'] = $atts['author'];
		}
		else{
			$performquery = false;							//if aksing for current user but current user isnt logged in
		}
	}
	
	if(isset($atts['category_name']))
	{
		$args['category_name'] = $atts['category_name'];
	}
	if(isset($atts['category_id']))
	{
		$args['category_id'] = $atts['category_id'];
	}
	
	$args['posts_per_page'] = get_option('q_num_questions') or '5';
	if(isset($atts['questions'])){
		$args['posts_per_page'] = $atts['questions'];
	}
	
	//====================================================================style the loop
	$divstyles = "";
	$titlestyles = "";
	if(isset($atts['bordercolor']))
	{
		$divstyles = "border: 3px solid " . $atts['bordercolor'] . ";";
		$titlestyles .= "background-color:" . $atts['bordercolor'] . ";";
	}
	if(isset($atts['title-color']))
	{
		$titlestyles .= "color:" . $atts['title-color'] . ";";
	}
	if(isset($atts['style']))
	{
		$divstyles .= $atts['style'];
	}
	
	$loophtml = '';
	
	$loophtml .= "<div class='question-cat-menu'>";
	$loophtml .= '<select name="event-dropdown" onchange=\'document.location.href=this.options[this.selectedIndex].value;\'><option value="">' . __('Select Category', 'qna-forum') . '</option>';

	$categories = get_categories();
	foreach ($categories as $category) {
		$loophtml .= '<option value="/?cat=' . $category->term_id . '&post_type=' . $q_question_post_type . '">' . $category->cat_name;
		$loophtml .= ' (' . $category->category_count . ')';
		$loophtml .= '</option>';
	}
	
	$loophtml .= '</select>';
	$loophtml .= '</div>';
	
/*
	// categories==================================
	$loophtml = "<div class='question-form-bottom'>" . __('Category', 'qna-forum') . "\n<select name='category' id='category";
	$categories = get_categories(array(
		'type' => 'post',
		'orderby' => 'count',
		'order' => 'DESC',
		'hide_empty' => 0
	));
	foreach($categories as $cat)
	{
		if (get_option('q_cat_' . $cat->term_id) == "TRUE")
		{
			$loophtml .= '<option value="' . $cat->term_id . '">' . $cat->cat_name . '</option>';
		}
	}
	$loophtml .= "</select>\n</div>";
*/
	
	//========================================================if loop is not to be performed
	if($performquery == false)
	{
		$loophtml .= "<div class='question-list' style='" . $divstyles . "'>";
		$loophtml .= "<span class='question-list-title' style='$titlestyles'>" . __('Login or Register','qna-forum') . "</span><div style='margin:10px'><p>" . __('To see your questons or ask new one please log in','qna-forum') . "</p>";
		$loophtml .= q_loginform(get_permalink()) . "</div></div>";
		return $loophtml;
	}

	//===========================================================================perform query
 	$q_query = new WP_Query($args);
 	
	//the loop ====================
	$loophtml .= "<div class='question-list' style='$divstyles'>";
	$loophtml .= "<span class='question-list-title' style='$titlestyles'>$content</span>";
	$loophtml .= "<ul class='q_question_list'>";
	if ( $q_query->have_posts() )
	{
		 while ( $q_query->have_posts() )
		 {
		 	$q_query->next_post();
		 	$question = get_post($q_query->post);
			$answerCount = get_comments_number($question->ID);
			$author = $question->post_author ? get_the_author_meta('display_name', $question->post_author) : get_post_meta($question->ID, 'name', true);
			$post_date = human_time_diff(strtotime($question->post_date_gmt));
			$temp_c = get_the_category($question->ID);
			$cat_name = $temp_c[0]->cat_name;
			
			$loophtml .= "<li><span class='list-question-title'><a class='list-answer-link' href='" . get_permalink($question->ID) ."'>" . $question->post_title . "</a></span><span>";
			$loophtml .= sprintf(_n("%d answer", "%d answers", $answerCount, 'qna-forum'), $answerCount);
			$loophtml .= " | " . __('Asked by','qna-forum') . "<b>$author</b>";
			$loophtml .= " | $post_date ". __('ago in','qna-forum') . " <a href='" . get_category_link($temp_c[0]->cat_ID) . "&#63;&amp;post_type=question'>$cat_name</a></span>";
			$loophtml .= "</li>";
		 }
	}
	$loophtml .= "</ul>";
	
	$loophtml .= "<span class='q_view_more'>" . qarchive_link(array(),__('View All Questions','qna-forum')) . '</span></div>';
	
	return $loophtml;
}

?>