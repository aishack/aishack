<?php
/*
Plugin Name: Domain-Change
Plugin URI: http://www.webtoolol.com/2009/06/09/domain-change-is-released/
Version: 1.2
Author: Soz
Author URI: http://www.webtoolol.com/
Description: This plugin is for who changed their wordpress blog from one domain to another domain. Including the 301 redirect and replace your old domain into the new domain, you will enjoy this plugin if you want to change your domain.
*/

if (! class_exists ( 'DomainChange' )) {
	class DomainChange {
		
		/* The options in the database, like below

		domainChangeArray = array(
			'oldDomain' => 'www.example.com',
			'isRedirect'=> true
		);

		*/
		var $currentOptionsArray = 'domainChangeArray';
		var $defaultDomainChangeArray = array ('oldDomain' => '', 'isRedirect' => false );
		var $databaseDomainChagedArray = array();
		var $siteURL = '';
		var $siteURLArray = array();
		var $oldSiteURLArray = array();
		
		function init() {
			$this->databaseDomainChagedArray = get_option( $this->currentOptionsArray);
			if($this->databaseDomainChagedArray['isRedirect']){
				$this->execute();
			}		
		}
		
		function install() {
			if (! get_option ( $this->currentOptionsArray )) {
				add_option ( $this->currentOptionsArray );
			} else {
				update_option ( $this->currentOptionsArray );
			}
		
		}
		
		function uninstall() {
			if (get_option ( $this->currentOptionsArray )) {
				delete_option ( $this->currentOptionsArray );
			}
		}
		
		//really execut the 301 redirect
		function execute() {
			$this->preDo ();
			$this->doing ();
			$this->afterDo ();
		}
		
		function preDo(){
			$this->purgeArray($this->databaseDomainChagedArray);
		}
		
		function doing(){
				$this->Redirect301();
		}
		
		function Redirect301(){
			// get all the needed data
			$this->siteURL = get_option('siteurl');
			$this->siteURLArray = parse_url($this->siteURL);
			$this->oldSiteURLArray = parse_url($this->databaseDomainChagedArray['oldDomain']);
			
			if($_SERVER['HTTP_HOST'] != $this->siteURLArray['host']){
				$oldPath = trim($this->oldSiteURLArray['path'], '/');
				$oldPath = substr( $_SERVER['REQUEST_URI'], strlen($oldPath)+1 );
				//$newPath = trim($this->siteURLArray['path'], '/');
				header ( 'HTTP/1.1 301 Moved Permanently' );
				header ( 'Location:' . trim($this->siteURL, '/') . '/' .$oldPath );
				exit ();
			}
		}
		
		// make sure the string in array is trimed and to lowered 
		function purgeArray($array){
			if(is_array($array)){
				foreach ($array as $value){
					if (is_string($value)){
						$value = strtolower(trim($value));
					}
				}
			}
		}
		
		function afterDo(){
			
		}
		

		// add the admin setting link, but the options page function is not include in this class.
		function adminMenu() {
			add_options_page ( 'Domain Change Setting', 'Domain Change', 8, 'domain-change/options.php' );
			//add_options_page('Domain Change Setting', 'Domain Change', 8, __FILE__, array($this,'options'));
		}
		
	
	} //end of DomainChange class define


}

if (! isset ( $domainChange )) {
	$domainChange = new DomainChange ( );
	add_action ( 'send_headers', array (&$domainChange, 'init' ) );
	
	//Add the admin setting
	add_action ( 'admin_menu', array (&$domainChange, 'adminMenu' ) );
	add_action('activate_domain-change/domain-change.php', 'install');
//add_action( 'admin_init', array(&$domainChange,'register_mysettings') );


}

?>