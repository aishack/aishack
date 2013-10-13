<?php
if(!isset($html))
{
	$html = "";
}
	
	
					//==============================================AUTHENTIFICATION=========================
$userinfo_html = "";

$t3 = __("Enter Your Name", 'qna-forum');
$t4 = __("Enter Your Email Address",'qna-forum');
	
	
if(!is_user_logged_in())
{
	if(get_option('q_loginrequired_ask')=="TRUE")				//force users to log in
	{
		$html = "<p>".__("Please login to ask a question",'qna-forum')."</p>";	
		$html .= q_loginform(get_permalink());
		return $html;
	}
	elseif(get_option('q_loginrequired_ask')=="name-and-email")
		{									//textboxes for name and email
			$userinfo_html .= <<<HTML
				<div class="question-user-details">
					<input type="text" class="question-title-box" value="$qname" name="name" onfocus="if(this.value == '$t3'){this.value = '';}" onblur="if(this.value == ''){this.value = '$t3';}" />
					<input type="text" class="question-title-box" value="$qemail" name="email" onfocus="if(this.value == '$t4'){this.value = '';}" onblur="if(this.value == ''){this.value = '$t4';}" />
HTML;
			
			if(get_option('users_can_register')==1)			//if users can register supply link to login page with rediect back
			{
				$userinfo_html .= "Or <a href='" . wp_login_url( get_permalink() ) . "'>log in</a>";
			}	
			$userinfo_html .= "</div>";
		}		
		

}


//==========================================================OUTPUT============================

$html .= $userinfo_html;					//include user name and email textboxes if required
	$t1 = __("Enter Question Title", 'qna-forum');
	$t2 = __("Enter Your Question Here",'qna-forum');
	$html .= <<<HTML
<input type="text" class="question-title-box" value="$qtitle" id="question-title-box-$questionformid" name="title" onfocus="if(this.value == '$t1'){this.value = '';}" onblur="if(this.value == ''){this.value = '$t1';}" />
HTML;
	if(get_option('qanda_rteditor')=='TRUE' && function_exists('wp_tiny_mce')){
		wp_tiny_mce( false , // true makes the editor "teeny"
			array(
				"editor_selector" => "question-box-$questionformid"
			)
		);		
	}
	$html .= <<<HTML
<textarea class="question-box" cols="80" rows="5" id="question-box-$questionformid" name="question" onfocus="if(this.value == '$t2'){this.value = '';}" onblur="if(this.value == ''){this.value = '$t2';}">$Qtext</textarea>
HTML;

	
	// categories==================================
	$html .= "<div class='question-form-bottom'>".__('Category','qna-forum').":<select name='category' id='category-" . $questionformid . "'>";
	$categories = get_categories(array(
		'type' => 'post',
		'orderby' => 'count',
		'order'=> 'DESC',
		'hide_empty'=>0
	));
	foreach($categories as $cat)
	{
		if(get_option('q_cat_' . $cat->term_id) == "TRUE")
		{
			$html .= '<option value="' . $cat->term_id . '">' . $cat->cat_name . '</option>';
		}
	}
	$html .= "</select>";
	
	$html .= "<input type='hidden' value='" . wp_create_nonce( 'q_question_form' ) . "' name='nonce' />";
	$html .= "<input type='hidden' name='action' value='q_ask_question' />";
	$html .= '<input type="button" name="ask" value="' . __('Ask','qna-forum') . '" onclick="askquestion(\'questionform-' . $questionformid . '\');"/></div>';

?>