<?php /*
//add_filter('comment_form','q_comment_fields');
function q_comment_fields()
{
	echo "<input type='submit' class='button commentbutton' tabindex='6' value='Ask Question' name='submit' />";
}

//add_filter('preprocess_comment','q_check_comment');
function q_check_comment($comm)
{
	if($_POST['submit'] == 'question')
	{
		$comm['comment_content'] .= 'question';
	}
	else
	{
		$comm['comment_content'] .= 'bla';
	}
}
*/ ?>