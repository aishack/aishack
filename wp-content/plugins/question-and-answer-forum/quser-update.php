<?php 
if ( ! wp_verify_nonce( $_POST['nonce'], 'q_quser_update_nonce' ) ){
	echo "<p class='quser-message'>Error - refresh the page a try again</p>";
	die;
}

global $current_user;						//info about the current user
get_currentuserinfo();

$message = "ProfileUpdated";
$args['ID'] = $current_user->ID;

if(isset($_POST['desc'])){
	$args['description'] =htmlentities($_POST['desc'],ENT_QUOTES,'UTF-8');
}
if(isset($_POST['password']) && $_POST['password'] != ""){
	if(isset($_POST['newpassword']) && $_POST['password'] == $_POST['newpassword']){
		$args['user_pass'] = $_POST['password'];
	}
	else{
		$message = "PasswordsDontMatch";
		echo q_quser_update_form( htmlentities($_POST['desc'],ENT_QUOTES,'UTF-8'),"Passwords Don't Match");
		exit;
	}
}
wp_update_user($args);
								//output the form
echo q_quser_update_form( htmlentities($_POST['desc'],ENT_QUOTES,'UTF-8'),"Profile Updated");
exit;
?>
