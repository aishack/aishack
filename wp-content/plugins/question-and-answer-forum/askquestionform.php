<?php 
load_plugin_textdomain( 'qna-forum', false, 'question-and-answer-forum/languages' );


										//STYLING INFORMATION=============
$formstyle = "";
$introstyle = "";
if(isset($atts['width']))
{
	$formstyle .= "width:" . $atts['width'] . ";";
}
if(isset($atts['style']))
{
	$formstyle .= $atts['style'];
}
if(isset($atts['bordercolor']))
{
	$formstyle .= "border: 2px solid " . $atts['bordercolor'] . ";";
	$introstyle .= "background-color:" . $atts['bordercolor'] . ";";
}


if(!isset($_POST['name']) || $_POST['name'] == null)
{
	$qname = __("Enter Your Name",'qna-forum');
}
else{
	$qname = $_POST['name'];
}
if(!isset($_POST['email']) || $_POST['email'] == null)
{
	$qemail = __("Enter Your Email Address",'qna-forum');
}
else{
	$qemail = $_POST['email'];
}
if(!isset($_POST['title']) || $_POST['title'] == null)
{
	$qtitle = __("Enter Question Title",'qna-forum');
}
else{
	$qtitle = $_POST['title'];
}
if(!isset($_POST['question']) || $_POST['question'] == null)
{
	$Qtext = __("Enter Your Question Here",'qna-forum');
}
else{
	$Qtext = $_POST['question'];
}

//begin the question form 
$html = '<form class="questionform" name="questionform-'. $questionformid . '" id="questionform-' . $questionformid. '" style=\'' . $formstyle. '\'>
<div class="question-form-intro" style="' . $introstyle . '">';						//introduction
$html .= $content ? $content :  __("Use the form below to ask a question",'qna-forum');
$html .= '</div>';	

include_once "coreform.php";				//main part of the form
$html .= '</form>';
$questionformid = $questionformid + 1;

?>