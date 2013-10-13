<?php
add_action('wp_ajax_q_choose_bestans', 'q_choose_bestans');
add_action('wp_ajax_nopriv_q_choose_bestans', 'q_choose_bestans');
function q_choose_bestans(){
	include "choosebestans.php";
	exit;
}

add_action('wp_ajax_q_ask_question', 'q_ask_question_ajax');
add_action('wp_ajax_nopriv_q_ask_question', 'q_ask_question_ajax');
function q_ask_question_ajax(){
	include "addquestion.php";
	exit;
}

add_action('wp_ajax_q_quser_update', 'q_quser_update_ajax');
add_action('wp_ajax_nopriv_q_quser_update', 'q_quser_update_ajax');
function q_quser_update_ajax(){
	include "quser-update.php";
	exit;
}
?>