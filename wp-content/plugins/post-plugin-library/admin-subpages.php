<?php

/*

	A simple library class to ease the use of a further level of submenus in the admin pages
	Uses no javascript but 'borrows' some CSS it shouldn't

*/

define('ADMIN_SUBPAGES_LIBRARY', true);

class admin_subpages {
	var $pages = array();
	var $parent_page = '';
	var $current_page = array();

	function admin_subpages($parent_page='') {
		register_shutdown_function(array(&$this, "__destruct"));
		$this->__construct($parent_page);
	}	

	function __construct($parent_page='') {
		if ($parent_page === '') {
			$parent_page = $_SERVER['QUERY_STRING'];
			$p1 = strpos($parent_page, 'page=');
			$p2 = strpos($parent_page, '&');
			if ($p2 === false) {
				$parent_page = substr($parent_page, $p1+5);
			} else {
				$parent_page = substr($parent_page, $p1+5, $p2-$p1-5);
			}
		}
		$this->parent_page = $parent_page;
	}
	
	function __destruct() {
	}

	function add_subpage($title, $slug, $view) {
		$this->pages[] = array('title' => $title, 'slug' => $slug, 'view' => $view);
	}
	
	function add_subpages($pages) {
		foreach ($pages as $page) {
			$this->pages[] = array('title' => $page[0], 'slug' => $page[1], 'view' => $page[2]);
		}
	}
	
	function page_from_slug($slug) {
		if (!isset($slug)) {
			return $this->pages[0];
		}
		foreach ($this->pages as $page) {
			if ($page['slug'] === $slug) {
				return $page;
			}
		}
		die('non-existent slug');
	}

	function display_menu() {
		echo "\n<ul id=\"submenu\" style=\"display: block\">\n";
		// for compatibility with WP mu
		$base = ($_SERVER['REDIRECT_URL']) ? $_SERVER['REDIRECT_URL'] : $_SERVER['PHP_SELF'];
		$base .= '?page=' . $this->parent_page . '&subpage=';
		$this->current_page = $this->page_from_slug($_GET['subpage']);
		foreach($this->pages as $page) {	
			if($page === $this->current_page) {
				echo "<li style=\"display: inline\"><a href=\"$base{$page['slug']}\" class=\"current\" style=\"display: inline\">{$page['title']}</a></li>\n";
			} else {
				echo "<li style=\"display: inline\"><a href=\"$base{$page['slug']}\" style=\"display: inline\">{$page['title']}</a></li>\n";
			}
		}
		echo "</ul>\n";
	}
	
	function display_view() {
		$this->current_page['view']();
	}

	function display() {
		$this->display_menu();
		$this->display_view();
	}
	
}

/* 		?>
		<script type="text/javascript">
			if (document.styleSheets) { 
				document.getElementById("submenu").id = "subpage";
				for (var i=0; i<document.styleSheets.length; i++) { 
					var styleSheet = document.styleSheets[i];          
					var ii = 0;                                        
					var cssRule = false; 
					do {                                            
						if (styleSheet.cssRules) {                   
							cssRule = styleSheet.cssRules[ii]; 
						} else {                                      
							cssRule = styleSheet.rules[ii];           
						}                                            
						if (cssRule && cssRule.selectorText) {
							var rulebits = cssRule.selectorText.toLowerCase().split(",");
							for (var j=0; j<rulebits.length; j++) { 
								if (rulebits[j].indexOf('#submenu') != -1) { 
									if (styleSheet.insertRule)
										styleSheet.insertRule(rulebits[j].replace('#submenu','#subpage') + ' {' + cssRule.style.cssText + '}', styleSheet.cssRules.length);
									else 
										styleSheet.addRule(rulebits[j].replace('#submenu','#subpage'), cssRule.style.cssText, -1);
								} 
							}
						}
						ii++;                                        
					} while (cssRule)                               
				}                                                   
			}                                                      
		</script>
		<?php
 */

?>