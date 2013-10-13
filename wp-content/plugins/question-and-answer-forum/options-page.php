<?php //==========================================================================================================
load_plugin_textdomain( 'qna-forum', false, 'question-and-answer-forum/languages' ); //i18n
  if (!current_user_can('manage_options'))  {				//check user has permission to access this page
    wp_die( __('You do not have sufficient permissions to access this page.') );
  }

//process options
if(isset($_POST['update']) && $_POST['update'] == "true")
{
	if(isset($_POST['feedback']) && $_POST['feedback'] != "")
	{
		$message = "
Site: " . get_bloginfo('wpurl') . "
Email: " . get_bloginfo('admin_email') ."
" . $_POST['feedback'];
		wp_mail("admin@trevorpythag.co.uk","Question and Answer Plugin",$message);
	}
}
if(isset($_POST['update']) && $_POST['update'] == "true")
{
	if(isset($_POST['loginrequired_ask']) && $_POST['loginrequired_ask'] == "TRUE")
	{
		update_option('q_loginrequired_ask','TRUE');	
	}
	elseif(isset($_POST['loginrequired_ask']) && $_POST['loginrequired_ask'] == "FALSE")
	{
		update_option('q_loginrequired_ask','FALSE');	
	}
	elseif(isset($_POST['loginrequired_ask']) && $_POST['loginrequired_ask'] == "name-and-email")
	{
		update_option('q_loginrequired_ask','name-and-email');
	}
}

if(isset($_POST['update']) && $_POST['update'] == "true")
{
	if(isset($_POST['edit_cat_links']) && $_POST['edit_cat_links'] == "TRUE")
	{
		update_option('q_cat_links','TRUE');	
	}
	else
	{
		update_option('q_cat_links','FALSE');	
	}
}

if(isset($_POST['update']) && $_POST['update'] == "true")
{
	if(isset($_POST['spam_filter']) && $_POST['spam_filter'] == "TRUE")					//spam
	{
		update_option('q_use_spam_filter','TRUE');	
	}
	else
	{
		update_option('q_use_spam_filter','FALSE');	
	}

	if(isset($_POST['hold_q_4_moderation']) && $_POST['hold_q_4_moderation'] == "TRUE")				//moderation
	{
		update_option('qanda_hold_q_4_moderation','TRUE');	
	}
	else
	{
		update_option('qanda_hold_q_4_moderation','FALSE');	
	}
}

if(isset($_POST['update']) && $_POST['update'] == "true")
{
	if(isset($_POST['num_questions']) && is_numeric($_POST['num_questions']))
	{
		update_option('q_num_questions',$_POST['num_questions']);
	}
}

if(isset($_POST['update']) && $_POST['update'] == "true"){
	$categories = get_categories(array(
										'type' => 'post',
										'orderby' => 'count',
										'order'=> 'DESC',
										'hide_empty' =>0
									));
	foreach($categories as $cat)
	{
		if(isset($_POST['show_cat_' . $cat->term_id]) && $_POST['show_cat_' . $cat->term_id] == "TRUE")
		{
			update_option('q_cat_' . $cat->term_id,'TRUE');	
		}
		else
		{
			update_option('q_cat_' . $cat->term_id,'FALSE');	
		}
	}
}

if(isset($_POST['update']) && $_POST['update'] == "true")
{
	if(isset($_POST['wpcomAPIkey']))
	{
		update_option('q_wpcomAPIkey',$_POST['wpcomAPIkey']);	
	}
	update_option('answer_email_subject',$_POST['answer_email_subject']);
	update_option('answer_email_content',$_POST['answer_email_content']);
}
if(isset($_POST['update']) && $_POST['update'] == "true")
{
	if(isset($_POST['email_admin']) && $_POST['email_admin'] == "TRUE")
	{
		update_option('q_email_admin','TRUE');	
	}
	else
	{
		update_option('q_email_admin','FALSE');	
	}
}
if(isset($_POST['update']) && $_POST['update'] == "true")
{
	if(isset($_POST['rteditor']) && $_POST['rteditor'] == "TRUE")
	{
		update_option('qanda_rteditor','TRUE');	
	}
	else
	{
		update_option('qanda_rteditor','FALSE');	
	}
}
if(isset($_POST['update']) && $_POST['update'] == "true")						//best answer settings
{
	if(isset($_POST['bestans']) && $_POST['bestans'] == "TRUE")
	{
		update_option('q_bestans','TRUE');	
	}
	else
	{
		update_option('q_bestans','FALSE');	
	}
	if(isset($_POST['bestans_title']))
	{
		update_option('q_bestans_title',$_POST['bestans_title']);	
	}
	if(isset($_POST['bestans_styles']))
	{
		update_option('q_bestans_styles',$_POST['bestans_styles']);	
	}
	if(isset($_POST['bestans_link']))
	{
		update_option('q_bestans_link',$_POST['bestans_link']);	
	}		
}

//============================================================================================Update user profile settings
if(isset($_POST['update']) && $_POST['update'] == "true")				
{
	if(isset($_POST['registration_page']) && $_POST['registration_page'] == "TRUE")		//login/registration page
	{
		update_option('q_registration_page','TRUE');	
	}
	else
	{
		update_option('q_registration_page','FALSE');	
	}

	////////////////////////////////////////////////////////////links
	if(isset($_POST['postauthor_quser_link']) && $_POST['postauthor_quser_link'] == "TRUE")		//Post Authors
	{
		update_option('q_postauthor_quser_link','TRUE');	
	}
	else
	{
		update_option('q_postauthor_quser_link','FALSE');	
	}
	
	if(isset($_POST['questionauthor_quser_link']) && $_POST['questionauthor_quser_link'] == "TRUE")		//Question Authors
	{
		update_option('q_questionauthor_quser_link','TRUE');	
	}
	else
	{
		update_option('q_questionauthor_quser_link','FALSE');	
	}

	if(isset($_POST['commentauthor_quser_link']) && $_POST['commentauthor_quser_link'] == "TRUE")		//Comment Authors
	{
		update_option('q_commentauthor_quser_link','TRUE');	
	}
	else
	{
		update_option('q_commentauthor_quser_link','FALSE');	
	}
	
	if(isset($_POST['answerauthor_quser_link']) && $_POST['answerauthor_quser_link'] == "TRUE")		//Answer Authors
	{
		update_option('q_answerauthor_quser_link','TRUE');	
	}
	else
	{
		update_option('q_answerauthor_quser_link','FALSE');	
	}
}
echo "<div class='wrap'>";
if(isset($_POST['update']) && $_POST['update'] == "true")
{
	if(isset($_POST['qusers']) && $_POST['qusers'] == "TRUE")
	{
		if(get_option('q_qusers') != "TRUE")
		{
			echo q_generate_quser_pages();					//generate the user pages if we are setting it from false	
		}
		update_option('q_qusers','TRUE');		
	}
	else
	{
		update_option('q_qusers','FALSE');
		q_delete_quser_pages();
	}
}
?>

<!--<div class="wrap">-->
	<?php
		if(isset($_POST['update']) && $_POST['update'] == "true"){
		?><div id="message" class="updated"><p>Options Saved</p></div><?php
		}?>
	<h2>Question and Answer Forum</h2>
	<iframe src="http://trevorpythag.co.uk/qandamessage.htm" style="border:none;width:75%;height:100px;"></iframe>
	<form method="POST">
	<h3>Give Feedback or Report Bug</h3>
		<p><textarea name="feedback" style="width:75%;"></textarea></p>
		<p>Note giving feedback will send the admin email address to the plugin author inorder that they may (though do not guarantee to) respond</p>
		<input type="submit" value="Send Feedback" /> 
	<h3>Question options</h3>
		<p>What are users required to provide to ask a question</p>
		<?php
			$userloggedin = "";
			$emailandname="";
			$nothing="";
			if(get_option('q_loginrequired_ask')=='TRUE')		//check correct option
			{
				$userloggedin = " checked='true' ";
			}
			elseif(get_option('q_loginrequired_ask')=='name-and-email')
			{
				$emailandname= " checked='true' ";
			}
			else{
				$nothing = " checked='true' ";
			}
						?>
			<input type="radio" id="loginrequired_ask1" name="loginrequired_ask" <?php echo $userloggedin;?> value="TRUE" /><span style="margin-left:20px;">Users must be logged in</span>
			<br/><input type="radio" id="loginrequired_ask2" name="loginrequired_ask" <?php echo $emailandname;?> value="name-and-email" /><span style="margin-left:20px;">Users must provide and name and email address</span>
			<br/><input type="radio" id="loginrequired_ask3" name="loginrequired_ask" <?php echo $nothing;?> value="FALSE" /><span style="margin-left:20px;">Users can ask questions anonymously</span>
		<p></p>
		<?php
			if(get_option('q_cat_links')=='TRUE')
			{
				?>
				<input type="checkbox" id="edit_cat_links" name="edit_cat_links" checked="true" value="TRUE" /><span style="margin-left:20px;">Make category links for questions on question pages</span>
				<?php
			}
			else
			{
				?>
				<input type="checkbox" id="edit_cat_links" name="edit_cat_links" value="TRUE" /><span style="margin-left:20px;">Make category links for questions on question pages</span>
				<?php
			}
		?>
		<p></p>
		<?php
			if(get_option('qanda_hold_q_4_moderation')=='TRUE')
			{
				?>
				<input type="checkbox" id="hold_q_4_moderation" name="hold_q_4_moderation" checked="true" value="TRUE" /><span style="margin-left:20px;"><?php echo __('Hold questions for moderation','qna-forum');?></span>
				<?php
			}
			else
			{
				?>
				<input type="checkbox" id="hold_q_4_moderation" name="hold_q_4_moderation" value="TRUE" /><span style="margin-left:20px;"><?php echo __('Hold questions for moderation','qna-forum');?></span>
				<?php
			}
		?>
		<p></p>
		<?php
			if(get_option('q_use_spam_filter')=='TRUE')
			{
				?>
				<input type="checkbox" id="spam_filter" name="spam_filter" checked="true" value="TRUE" /><span style="margin-left:20px;">Check for spam</span>
				<?php
			}
			else
			{
				?>
				<input type="checkbox" id="spam_filter" name="spam_filter" value="TRUE" /><span style="margin-left:20px;">Check for spam</span>
				<?php
			}
		?>
		<p></p><input type="text" id="wpcomAPIkey" name="wpcomAPIkey" value="<?php echo get_option('q_wpcomAPIkey');?>" /><span style="margin-left:20px;">Wordpress.com API key for checking spam</span>
<p></p>
		<?php
			if(get_option('q_email_admin')=='TRUE')
			{
				?>
				<input type="checkbox" id="email_admin" name="email_admin" checked="true" value="TRUE" /><span style="margin-left:20px;">Email admin when a new question is asked</span>
				<?php
			}
			else
			{
				?>
				<input type="checkbox" id="email_admin" name="email_admin" value="TRUE" /><span style="margin-left:20px;">Email admin when a new question is asked</span>
				<?php
			}
		?>
		<p></p>
		<?php $num_questions = get_option('q_num_questions') or '5'; ?>
		<input type="text" id="num_questions" name="num_questions" value="<?php echo $num_questions ?>" /><span style="margin-left:20px;">Default number of questions to display</span>
		<p></p>

		<?php
			if(get_option('qanda_rteditor')=='TRUE')
			{
				?>
				<input type="checkbox" id="rteditor" name="rteditor" checked="true" value="TRUE" /><span style="margin-left:20px;">Provide a rich text editor (Tiny MCE) for users when asking questions</span>
				<?php
			}
			else
			{
				?>
				<input type="checkbox" id="rteditor" name="rteditor" value="TRUE" /><span style="margin-left:20px;">Provide a rich text editor (Tiny MCE) for users when asking questions</span>
				<?php
			}
		?>
		<p></p>	
		<br/>
		<div>
			<h3>Ask Question Form</h3>
			<p>When a user asks a question they can choose a category for the question. Select the categories below that you want the user to be able to choose from when asking a question</p>
			<p>
				<?php
					$categories = get_categories(array(
														'type' => 'post',
														'orderby' => 'count',
														'order'=> 'DESC',
														'hide_empty'=>0
													));
					foreach($categories as $cat)
					{
						//echo $_POST['show_cat_' . $cat->term_id];
						if(get_option('q_cat_' . $cat->term_id )=='TRUE'){
							$checked = 'checked="true"';
						}
						else{
							$checked = "";
						}
						echo '<input type="checkbox" id="show_cat_' . $cat->term_id . '" name="show_cat_' . $cat->term_id . '" value="TRUE" ' . $checked . '><span style="margin-left:20px;">' . $cat->name .'</span> <br/>';
					}
					
				?>
			</p>
		</div>
		<!--                                                           BEST ANSWERS============================== -->
		<div>
			<h3>Best Answers</h3>
			<p><?php
				if(get_option('q_bestans')=='TRUE')
				{
					?>
					<input type="checkbox" id="bestans" name="bestans" checked="true" value="TRUE" /><span style="margin-left:20px;">Allow question author to choose a best answer</span>
					<?php
				}
				else
				{
					?>
					<input type="checkbox" id="bestans" name="bestans" value="TRUE" /><span style="margin-left:20px;">Allow question author to choose a best answer</span>
					<?php
				}
			?>
			</p><p>
			<input type="text" name="bestans_title" id="bestans_title" value="<?php echo esc_attr(get_option('q_bestans_title')); ?>" /> <span style="margin-left:20px;">Text to be displayed at the start of a best answer	</span>
			<br />
			<input type="text" name="bestans_link" id="bestans_link" value="<?php echo esc_attr(get_option('q_bestans_link')); ?>" /> <span style="margin-left:20px;">Text to be displayed on the link to choose an answer as the best answer</span>
			</p><p>
				If best answers are used the content of the best answer will be enclosed with a "div" with id "q_bestans" which you can use in your style sheet to style the best answer. Alternativley you can enter css styles to included for the best answer below:
				<textarea name="bestans_styles"  id="bestans_styles" style="width:75%;"><?php echo get_option('q_bestans_styles'); ?></textarea>
			</p>		
		</div>
		<div>
		<h3>New Answer Email Notifications</h3>
		<p></p>
		<p>You can use the following shorthands for values in the email:
		<ul>
			<li>%BLOGURL%</li>
			<li>%QUESTIONTITLE%</li>
			<LI>%QUESTION%</LI>
			<LI>%ANSWER%</LI>
			<LI>%AUTHOR%</LI>
		</ul>	
		</p>
		<p><label>Subject</label></p>
		<p><input type="text" name="answer_email_subject" style="width:75%;" value="<?php echo esc_attr(get_option('answer_email_subject')); ?>" /></p>
		<p><label>Content</label></p>
		<p><textarea name="answer_email_content" style="width:75%;"><?php echo esc_attr(get_option('answer_email_content')); ?></textarea></p>
		</div>
		

		<div>
		<h3>Users</h3>
		<p>You can use this plugin to create profile pages for your users which can contain their description Gravatar and number of questions, answers and best answers they have provided. However, if you have another plugin dedicated to managing users it is preferable to disable this feature can avoid conflicts</p>
		<p><?php
				if(get_option('q_qusers')=='TRUE')			//let plugin manage profile pages
				{
					?>
					<input type="checkbox" id="qusers" name="qusers" checked="true" value="TRUE" /><span style="margin-left:20px;">Let the question and answer plugin manage  user profile pages</span>
					<?php
				}
				else
				{
					?>
					<input type="checkbox" id="qusers" name="qusers" value="TRUE" /><span style="margin-left:20px;">Let the question and answer plugin manage  user profile pages</span>
					<?php
				}
				
				echo "<br />";
				if(get_option('q_registration_page')=='TRUE')			//let plugin manage login and registration pages
				{
					?>
					<input type="checkbox" id="registration_page" name="registration_page" checked="true" value="TRUE" /><span style="margin-left:20px;">Create a login and registration page controled by the plugin</span>
					<?php
				}
				else
				{
					?>
					<input type="checkbox" id="registration_page" name="registration_page" value="TRUE" /><span style="margin-left:20px;">Create a login and registration page controled by the plugin</span>
					<?php
				}
				echo "<br/> If the above check box is selected then the login and current users profile page is at <br /><a href='" . get_permalink(get_option('q_quser_default_pageid')) . "' style='font-size:larger;'>" . get_permalink(get_option('q_quser_default_pageid')) . "</a>";
				echo "<br />";
				echo "<p>When should a users link be replace to a link to their profile page</p>";
				if(get_option('q_postauthor_quser_link')=='TRUE')		//replace post author links
				{
					?>
					<input type="checkbox" id="postauthor_quser_link" name="postauthor_quser_link" checked="true" value="TRUE" /><span style="margin-left:20px;">Post Authors</span>
					<?php
				}
				else
				{
					?>
					<input type="checkbox" id="postauthor_quser_link" name="postauthor_quser_link" value="TRUE" /><span style="margin-left:20px;">Post Authors</span>
					<?php
				}
				echo "<br />";
				if(get_option('q_questionauthor_quser_link')=='TRUE')		//replace question author links
				{
					?>
					<input type="checkbox" id="questionauthor_quser_link" name="questionauthor_quser_link" checked="true" value="TRUE" /><span style="margin-left:20px;">Question Authors</span>
					<?php
				}
				else
				{
					?>
					<input type="checkbox" id="questionauthor_quser_link" name="questionauthor_quser_link" value="TRUE" /><span style="margin-left:20px;">Question Authors</span>
					<?php
				}
				echo "<br/>";	
				if(get_option('q_commentauthor_quser_link')=='TRUE')		//replace comment author links
				{
					?>
					<input type="checkbox" id="commentauthor_quser_link" name="commentauthor_quser_link" checked="true" value="TRUE" /><span style="margin-left:20px;">Comment Authors</span>
					<?php
				}
				else
				{
					?>
					<input type="checkbox" id="commentauthor_quser_link" name="commentauthor_quser_link" value="TRUE" /><span style="margin-left:20px;">Comment Authors</span>
					<?php
				}
				echo "<br/>";	
				if(get_option('q_answerauthor_quser_link')=='TRUE')		//replace answer author links
				{
					?>
					<input type="checkbox" id="answerauthor_quser_link" name="answerauthor_quser_link" checked="true" value="TRUE" /><span style="margin-left:20px;">Answer Authors</span>
					<?php
				}
				else
				{
					?>
					<input type="checkbox" id="answerauthor_quser_link" name="answerauthor_quser_link" value="TRUE" /><span style="margin-left:20px;">Answer Authors</span>
					<?php
				}
			?></p>
		</div>
	
	
		<input type="hidden" name="update" value="true" />
		<input type="submit" value="save options" /> 

	</form>
</div>

