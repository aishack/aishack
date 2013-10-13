<?php

//
//  Custom Child Theme Functions
//

// I've included a "commented out" sample function below that'll add a home link to your menu
// More ideas can be found on "A Guide To Customizing The Thematic Theme Framework" 
// http://themeshaper.com/thematic-for-wordpress/guide-customizing-thematic-theme-framework/

// Adds a home link to your menu
// http://codex.wordpress.org/Template_Tags/wp_page_menu
//function childtheme_menu_args($args) {
//    $args = array(
//        'show_home' => 'Home',
//        'sort_column' => 'menu_order',
//        'menu_class' => 'menu',
//        'echo' => true
//    );
//	return $args;
//}
//add_filter('wp_page_menu_args','childtheme_menu_args');

// Unleash the power of Thematic's dynamic classes
// 
// define('THEMATIC_COMPATIBLE_BODY_CLASS', true);
// define('THEMATIC_COMPATIBLE_POST_CLASS', true);

// Unleash the power of Thematic's comment form
//
// define('THEMATIC_COMPATIBLE_COMMENT_FORM', true);

// Unleash the power of Thematic's feed link functions
//
// define('THEMATIC_COMPATIBLE_FEEDLINKS', true);

$enable_below_post_fb_like = 1;
$strReadMore = "Read more";

function aishack_init()
{
	remove_action('thematic_header', 'thematic_access', 9);
}

function post_is_in_descendant_category( $cats, $_post = null )
{
	foreach ( (array) $cats as $cat ) {
		// get_term_children() accepts integer ID only
		$descendants = get_term_children( (int) $cat, 'category');
		if ( $descendants && in_category( $descendants, $_post ) )
			return true;
	}
	return false;
}


function aishack_favicon() 
{
	?>
	<link rel="shortcut icon" href="<?php echo bloginfo('stylesheet_directory') ?>/images/favicon.gif"/>
	<?php
}

function aishack_custom_nav()
{
	global $post;
	?>
    <div id="topnav"><ul>
    <li><a href="/" <?php if(is_home()) echo 'class="current"';?> >Home</a></li>
    <li><a href="<?php $catid = get_cat_ID('Tutorials'); echo get_category_link($catid); ?>" <?php if(is_page('Tutorials')) echo 'class="current"';?> >Tutorials</a></li>
    <li><a href="<?php $catid = get_cat_ID('Blog'); echo get_category_link($catid); ?>" <?php if(post_is_in_descendant_category('Blog', $post)) echo 'class="current"'; ?> >Blog</a></li>
    <li><a href="/about" <?php if(is_page('About')) echo 'class="current"'; ?> >About</a></li>
    <li><a href="contact" <?php if(is_page('Contact')) echo 'class="current"';?> >Contact</a></li>
    <li class='searchitem'><form id="searchform" method="get" action="/">
		<div>
			<input id="s" name="s" type="text" value="Type and hit enter to search" onfocus="if (this.value == 'Type and hit enter to search') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Type and hit enter to search';}" size="27" tabindex="1">
			<input id="searchsubmit" name="searchsubmit" type="submit" value="Search" tabindex="2">
		</div>
	</form></li>
    <li><a id="pull"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></a></li>
    </ul></div>
    <?php
}

function aishack_crumbs()
{
	global $post;
	
	if(!is_home() && !is_front_page())
	{
	?>
        <div id="crumbs"><ul>
        <li class="home"><a href="<?php echo get_bloginfo('url'); ?>"><span>Home</span></a></li>
        <?php
        if(is_category())
        {
            global $wp_query;
            $cat_obj = $wp_query->get_queried_object();
            $thisCat = $cat_obj->term_id;
            $thisCat = get_category($thisCat);
            
            
			if($thisCat->parent!=0)
			{
				$parentCat = get_category($thisCat->parent);
            	$toprint = "<li>".get_category_parents($parentCat, true, '</li><li>')."</li>";;
				$toprint = substr($toprint, 0, strlen($toprint)-9);
				echo $toprint;
			}
            
            echo "<li class='lastcrumb'>".single_cat_title('', false);
			if(get_query_var('paged')) echo ' ('.__('Page') . get_query_var('paged').')';
			echo "</li>";
        }
        elseif(is_day())
        {
            echo "<li><a href='".get_year_link(get_the_time('Y'))."'>".get_the_time('Y')."</a></li>";
            echo "<li><a href='".get_month_link(get_the_time('Y'),get_the_time('m'))."'>".get_the_time('F')."</a></li>";
            echo "<li class='lastcrumb'>".get_the_time('d');
			if(get_query_var('paged')) echo ' ('.__('Page') . get_query_var('paged').')';
			echo "</li>";
        }
        elseif(is_month())
        {
            echo "<li><a href='".get_year_link(get_the_time('Y'))."'>".get_the_time('Y')."</a></li>";
            echo "<li class='lastcrumb'>".get_the_time('F');
			if(get_query_var('paged')) echo ' ('.__('Page') . get_query_var('paged').')';
			echo "</li>";
        }
        elseif(is_year())
        {
            echo "<li class='lastcrumb'>".get_the_time('Y');
			if(get_query_var('paged')) echo ' ('.__('Page') . get_query_var('paged').')';
			echo "</li>";
        }
        elseif(is_single() && !is_attachment())
        {
            if(get_post_type()!='post')
            {
                $post_type = get_post_type_object(get_post_type());
                $slug = $post_type->rewrite;
                echo "<li><a href='".get_blog_info('url')."/".$slug['slug']."/'>".$post_type->labels->singular_name."</a></li>";
                echo "<li class='lastcrumb'>".get_the_title()."</li>";
            }
            else
            {
                $cat = get_the_category($post->ID);
				
				if($cat[0]->cat_name!='Featured')
	                $cat = $cat[0];
				else
					$cat = $cat[1];
                
				$thisCat = get_category($cat);
            
            
            	$toprint = "<li>".get_category_parents($thisCat, true, '</li><li>')."</li>";;
				$toprint = substr($toprint, 0, strlen($toprint)-9);
				echo $toprint;
                echo "<li class='lastcrumb'>".get_the_title()."</li>";
            }
        }
        elseif(is_page() && !$post->post_parent)
        {
            echo "<li class='lastcrumb'>".get_the_title()."</li>";
        }
        elseif(is_page() && $post->post_parent)
        {
            $parent_id = $post->post_parent;
            $breadcrumbs = array();
            while($parent_id)
            {
                $page = get_page($parent_id);
                $breadcrumbs[] = "<li><a href='".get_permalink($page->ID)."'>".get_the_title($page->ID)."</a></li>";
                $parent_id = $page->post_parent;
            }
            
            $breadcrumbs = array_reverse($breadcrumbs);
            foreach($breadcrumbs as $crumb) echo $crumb;
            echo "<li class='lastcrumb'>".get_the_title()."</li>";
        }
        elseif(is_search())
        {
            echo "<li class='lastcrumb'>Search results for '".get_search_query();
			if(get_query_var('paged')) echo ' ('.__('Page') . get_query_var('paged').')';
			echo "'</li>";
        }
        elseif(is_tag())
        {
            echo "<li class='lastcrumb'>Tag '".single_tag_title('', false);
			if(get_query_var('paged')) echo ' ('.__('Page') . get_query_var('paged').')';
			echo "'</li>";
        }
        elseif(is_author())
        {
            global $author;
            $userdata = get_userdata($author);
            echo "<li class='lastcrumb'>Author: ".$userdata->display_name;
			if(get_query_var('paged')) echo ' ('.__('Page') . get_query_var('paged').')';
			echo "</li>";
        }
        elseif(is_404())
        {
            echo "<li class='lastcrumb'>Error 404</li>";
        }
	}
    ?>
    </ul></div>
    <!-- crumbs -->
    <?php
}

function aishack_postimage()
{
	global $post;
	$metavalues = get_post_meta($post->ID, "thesis_post_image");
	
	if(!$metavalues)
		return;
		
	echo "<img class='post-image' src='".$metavalues[0]."' />";
}

function aishack_belowpost()
{
	if($enable_below_post_fb_like==0)
		return;
	
	global $post;
	?>
    
    <?php
}

function aishack_header_scripts()
{
	//<script language="javascript" src="http://code.jquery.com/jquery-1.6.1.min.js"></script>
	?>
    <meta name="HandheldFriendly" content="True">
    <meta name="MobileOptimized" content="320">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script language="javascript" src="/wp-content/themes/aishack_responsive/scripts/domtabs.js"></script>
    <?php
}

function aishack_footer_scripts()
{
	?>
    <script language="javascript" src="/wp-content/themes/aishack_responsive/scripts/jquery.mobilemenu.js"></script>
    <script language="javascript" src="/wp-content/themes/aishack_responsive/custom.js"></script>
    <script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-587551-5']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
    <?php
}

function display_category_list()
{
	$ret = "";
	if(!is_category('Blog'))
	{
		$firstpart = "<ul id='category-list'>";
		$args=array('orderby' => 'name', 'order' => 'ASC');
		$categories=get_categories($args);
		foreach($categories as $category)
		{ 
			if($category->name == 'Blog') continue;
			if($category->name == 'Tutorials')
			{
				$category->name='All tutorials';
				$temp='<li ';
				if(is_category($category->term_id)) $temp.='class="selected"';
					$temp.='><a href="' . get_category_link( $category->term_id ) . '" title="' . sprintf( __( "View all posts in %s" ), $category->name ) . '"	>' . $category->name.'</a></li> ';
				$ret = $temp.$ret;
			}
			else
			{
				$ret.='<li ';
				if(is_category($category->term_id)) $ret.='class="selected"';
					$ret.='><a href="' . get_category_link( $category->term_id ) . '" title="' . sprintf( __( "View all posts in %s" ), $category->name ) . '"	>' . $category->name.'</a></li> ';
			}
		}
		
		$ret.='</ul>';
		
		$ret = $firstpart.$ret;
	}
	else
	{
		//$ret = "<h1 class='page-title'>Browse blog entries</h1>";
	}
	
	return $ret;
}

function childtheme_override_index_loop()
{
	global $post, $strReadMore;
	$oounter = 0;
	
	$backup = $post;
	query_posts(array ( 'category_name' => 'Featured'));
	?>
    <div id="featured">
    <div id="controls">
    <span id="one" class="slideshow-control selected">First</span>
    <span id="two" class="slideshow-control">Second</span>
    <span id="three" class="slideshow-control">Three</span>
    </div>
    <ul>
		<?php
    	while(have_posts())
		{
			the_post();
			$counter++;
			?>
            <li id="featured-<?php echo $counter; ?>"><div id="post-<?php the_ID() ?>" class="<?php thematic_post_class() ?>">
            <?php $metavalue = get_post_meta($post->ID, 'thesis_post_image'); ?>
            <a href="<?php echo get_permalink(); ?>"><img class='post-image-featured' src="/wp-content/themes/aishack_responsive/scripts/timthumb.php?src=<?php echo $metavalue[0]; ?>&w=640&h=175" /></a>
            <h2><a href="<?php echo get_permalink(); ?>"><?php the_title(); ?></a></h2>
            <div class="entry-content">
            <?php the_content($strReadMore); ?>
            </div>
            </div></li>
            <?php
			if($counter==3) break;
		}
	?>
    </ul></div>
	<div id="featured-divider"><span id="recent">Overly Recent Tutorials</span></div><?php
	
	$counter=0;
	$post = $backup;
	query_posts('cat=-185&nopaging=true');
	
	?>
    <div id="recent-home">
    <?php
	while(have_posts())
	{
		the_post();
		$counter+=1;
		?>
		<div class="column <?php if ($counter == 1) { echo 'one'; } elseif ($counter==2) { echo 'two'; } else { echo 'three'; } ?>">
                <div class="clear-fix">
                    <div id="post-<?php the_ID() ?>" class="<?php thematic_post_class() ?>">
                    <?php $metavalues = get_post_meta($post->ID, "thesis_post_image");
						if($metavalues[0]) {?>
							<a href="<?php echo get_permalink(); ?>"><img class='post-image-small' src='/wp-content/themes/aishack_responsive/scripts/timthumb.php?src=<?php echo urlencode($metavalues[0]);?>&w=200&h=55&q=75' /></a><?php } ?>
                        <h2 class="entry-title"><a href="<?php echo get_permalink(); ?>" title="<?php echo the_title(); ?>" rel="bookmark"><?php echo the_title(); ?></a></h2>
                        <div class="entry-content">
                            <?php the_content($strReadMore); ?>
                            <?php //wp_link_pages('before=<div class="page-link"><ol>' .__('Pages:', 'thematic') . '&after=</ol></div>&link_before=<li>&link_after=</li>') ?>
                        </div>
                            <?php //thematic_postfooter(); ?>
                    </div><!-- .post -->
                </div><!-- .clear-fix -->
            </div><!-- .column -->
 
                    <?php comments_template();
                    if ($count==$thm_insert_position) { get_sidebar('index-insert');}
 
 
        $count = $count + 1;
		
		if($counter==3)
			break;
	}
	?>
    </div>
    <div id="featured-divider"><span id="tut-categories">Tutorial categories</span></div>
    <div id="front-page-ad"></div>
    <?php
	echo display_category_list(true);	// True => show 'all categories' link as well
}

/*function childtheme_override_single_post () {
//do stuff
}*/

function childtheme_override_postheader() {
	global $post, $strReadMore, $enable_below_post_fb_like;
	
		$metavalues = get_post_meta($post->ID, "thesis_post_image");
		if($metavalues[0])
		{
			echo "<img class='post-image";
			if(!is_singular())
				echo '-multiple';
			echo "' src='/wp-content/themes/aishack_responsive/scripts/timthumb.php?src=".urlencode($metavalues[0]);
			if(!is_singular())
				echo "&w=240&h=175&q=75' width='200' height='110' />";
			else
				echo "&w=640&h=175&q=75' />";
		}
		?>
		<h1 class="entry-title<?php if(!is_singular()) { echo ' no-bottom-margin no-bottom-padding'; } ?>"><a href="<?php the_permalink(); ?>" title="<?php the_title(); ?>" rel="bookmark"><?php the_title(); ?></a></h1>
		<div class="entry-meta"><span class="meta-prep meta-prep-author">By </span><span class="author vcard"><?php the_author_posts_link('test'); ?></span><span class="meta-sep meta-sep-entry-date"> | </span><span class="meta-prep meta-prep-entry-date">Published: </span><span class="entry-date"><?php the_date(); ?></span><?php edit_post_link('Edit', '<span class="meta-sep meta-sep-edit"> | </span><span class="entry-date">', "</span>"); ?></div>
        
        <?php if($enable_below_post_fb_like!=0 && is_singular())
		{
			?>
			<iframe src="http://www.facebook.com/plugins/like.php?app_id=120556718029035&amp;href=http%3A%2F%2Ffacebook.com%2Faishack&amp;send=false&amp;layout=standard&amp;width=600&amp;show_faces=true&amp;action=like&amp;colorscheme=light&amp;font=verdana&amp;height=80" scrolling="no" frameborder="0" class="fblike-frame"  allowTransparency="true"></iframe>
			<?php
		} ?>
	<?php if(is_singular()) { ?><div class="post-divider"></div><?php } ?><?php
}

function childtheme_override_single_post()
{ 
	global $post, $page, $numpages;
	thematic_abovepost(); ?>
			
	<div id="post-<?php the_ID();
	echo '" ';
	if (!(THEMATIC_COMPATIBLE_POST_CLASS))
	{
		post_class();
		echo '>';
	}
	else
	{
		echo 'class="';
		thematic_post_class();
		echo '">';
	}
     thematic_postheader(); ?>
	<div class="entry-content">
		<?php thematic_content(); ?>
		<?php if($numpages>1) { ?>
			<hr />
			<div class="page-link">
			<p><strong>More in this series</strong></p>
			<ol>
			<?php 
				for($i=1;$i<=$numpages;$i++)
				{
					$text = get_post_custom_values('page_desc_'.$i);
					$text = $text[0];
					echo "<li>";
					if($i!=$page)
					{
						echo _wp_link_page($i);
						echo "$text";
						echo "</a>";
					}
					else
					{
						echo "$text";
					}
				
					echo "</li>";
				}
				//wp_link_pages('before=<div class="page-link"><ol>' .__('Pages:', 'thematic') . '&after=</ol></div>&link_before=<li>&link_after=</li>')
			?>
			</ol>
			</div>
		<?php } // has more pages? ?>
	</div><!-- .entry-content -->
	<?php thematic_postfooter(); ?>
	</div><!-- #post -->
	<?php
	thematic_belowpost();
}

function childtheme_override_postfooter() {
	global $post, $strReadMore, $enable_below_post_fb_like;
	
	if(is_single())
	{
		?>
    	<div class="post-divider"><span class="uplink">Back to top</span></div>
	    <?php
	}
	
	if($enable_below_post_fb_like!=0 && is_singular())
	{
		?>
       	<iframe src="http://www.facebook.com/plugins/like.php?app_id=120556718029035&amp;href=http%3A%2F%2Ffacebook.com%2Faishack&amp;send=false&amp;layout=standard&amp;width=600&amp;show_faces=true&amp;action=like&amp;colorscheme=light&amp;font=verdana&amp;height=80" scrolling="no" frameborder="0" class="fblike-frame" allowTransparency="true"></iframe>
   	    <?php
	}
	
	if(is_single())
	{
		$downloads = get_post_custom_values('downloads');
		$summary = get_post_custom_values('summary');
		
		?>
        
        <?php if(count($downloads)>0 || count($summary)>0) { ?>
        	<div id="additional"><div id="downloads"><h3><span id="downloadpackage"></span>Downloads</h3><ul><?php
		
		if(count($downloads)>0)
		{
			foreach($downloads as $key => $current)
			{
				$temp = explode(" ", $current, 3);
				
				echo "<li><a href='".$temp[1]."'><img src='/wp-content/themes/aishack_responsive/images/";
				if($temp[0]=="zip")
					echo "page_white_compressed.png";
				else if($temp[0]=="pdf")
					echo "page_white_acrobat.png";
				else if($temp[0]=="pic")
					echo "page_white_picture.png";
				else if($temp[0]=="ppt")
					echo "page_white_powerpoint.png";
				else if($temp[0]=="doc")
					echo "page_word.png";
				else if($temp[0]=="git")
					echo "github-icon.png";
				else 
					echo "page_world.png";
						
				echo "' />".$temp[2]."</a></li>";
			}
		}
		else
			echo "<p>No related downloads.</p>";
			
		?></ul></div><div id="summary"><h3><span id="lightbulb"></span>Summary</h3><?php if(count($summary)>0) echo $summary[0]; else echo "<p>No summary.</p>"; ?></div><div class="affiliate" id="the_aff"></div></div>
        <?php } 
		
		if(function_exists('related_posts'))
			related_posts();
	}
	elseif(is_category())
	{
		?>
        <a href="<?php the_permalink(); ?>" class="more-link"><?php echo $strReadMore; ?></a>
        <?php
	}
}

function childtheme_override_page_title()
{	
	global $post;
	
	$content = '';
	if (is_attachment()) {
			$content .= '<h2 class="page-title"><a href="';
			$content .= apply_filters('the_permalink',get_permalink($post->post_parent));
			$content .= '" rev="attachment"><span class="meta-nav">&laquo; </span>';
			$content .= get_the_title($post->post_parent);
			$content .= '</a></h2>';
	} elseif (is_author()) {
			$content .= '<h1 class="page-title author">';
			$author = get_the_author_meta( 'display_name' );
			$content .= __('Author Archives: ', 'thematic');
			$content .= '<span>';
			$content .= $author;
			$content .= '</span></h1>';
	} elseif (is_category()) {
			/*$content .= '<h1 class="page-title">';
			$content .= __('Category Archives:', 'thematic');
			$content .= ' <span>';
			$content .= single_cat_title('', FALSE);
			$content .= '</span></h1>' . "\n";
			$content .= '<div class="archive-meta">';
			if ( !(''== category_description()) ) : $content .= apply_filters('archive_meta', category_description()); endif;
			$content .= '</div>';*/
			$catid = get_cat_id('Blog');
			
			if(is_category($catid))
				$content .= '<h1 class="page-title">Browse blog entries</h1>';
			else		
				$content .= '<h1 class="page-title">Browse by category</h1>';
			$content .= display_category_list();
	} elseif (is_search()) {
			$content .= '<h1 class="page-title">';
			$content .= __('Search Results for:', 'thematic');
			$content .= ' <span id="search-terms">';
			$content .= esc_html(stripslashes($_GET['s']));
			$content .= '</span></h1>';
	} elseif (is_tag()) {
			$content .= '<h1 class="page-title">';
			$content .= __('Tag Archives:', 'thematic');
			$content .= ' <span>';
			$content .= __(thematic_tag_query());
			$content .= '</span></h1>';
	} elseif (is_tax()) {
			global $taxonomy;
			$content .= '<h1 class="page-title">';
			$tax = get_taxonomy($taxonomy);
			$content .= $tax->labels->name . ' ';
			$content .= __('Archives:', 'thematic');
			$content .= ' <span>';
			$content .= thematic_get_term_name();
			$content .= '</span></h1>';
	}	elseif (is_day()) {
			$content .= '<h1 class="page-title">';
			$content .= sprintf(__('Daily Archives: <span>%s</span>', 'thematic'), get_the_time(get_option('date_format')));
			$content .= '</h1>';
	} elseif (is_month()) {
			$content .= '<h1 class="page-title">';
			$content .= sprintf(__('Monthly Archives: <span>%s</span>', 'thematic'), get_the_time('F Y'));
			$content .= '</h1>';
	} elseif (is_year()) {
			$content .= '<h1 class="page-title">';
			$content .= sprintf(__('Yearly Archives: <span>%s</span>', 'thematic'), get_the_time('Y'));
			$content .= '</h1>';
	} elseif (isset($_GET['paged']) && !empty($_GET['paged'])) {
			$content .= '<h1 class="page-title">';
			$content .= __('Blog Archives', 'thematic');
			$content .= '</h1>';
	}
	$content .= "<div class='post-divider'></div>\n";
	echo apply_filters('thematic_page_title', $content);
}

function childtheme_override_previous_post_link() {
}

function childtheme_override_next_post_link() {
}

function childtheme_override_category_archives() {
}

function childtheme_override_nav_above() {
}

function childtheme_override_nav_below($prelabel = '', $nxtlabel = '', $pages_to_show = 8, $always_show = false)
{
	global $request, $posts_per_page, $wpdb, $paged;

	$custom_range = round($pages_to_show/2);
	if (!is_single() && !is_front_page())
	{
		if(!is_category())
		{
			preg_match('#FROM\s(.*)\sORDER BY#siU', $request, $matches);
		}
		else
		{
			preg_match('#FROM\s(.*)\sGROUP BY#siU', $request, $matches);
		}
		$blog_post_count = $matches[1];
		$numposts = $wpdb->get_var("SELECT COUNT(DISTINCT ID) FROM $blog_post_count");
		$max_page = ceil($numposts /$posts_per_page);
		if(empty($paged))
		{
			$paged = 1;
		}
		if($max_page > 1 || $always_show)
		{
			echo "<div class='page-nav'><div class='page-nav-intro'>Page $paged of $max_page</div>";
			if ($paged >= ($pages_to_show-2))
			{
				echo '<div class="page-number"><a href="'.get_pagenum_link().'">1</a></div><div class="elipses">...</div>';
			}
			for($i = $paged - $custom_range; $i <= $paged + $custom_range; $i++)
			{
				if ($i >= 1 && $i <= $max_page)
				{
					if($i == $paged)
					{
						echo "<div class='current-page-number'>$i</div>";
					}
					else
					{
						echo '<div class="page-number"><a href="'.get_pagenum_link($i).'">'.$i.'</a></div>';
					}
				}
			}
			if (($paged+$custom_range) < ($max_page))
			{
				echo '<div class="elipses">...</div><div class="page-number"><a href="'.get_pagenum_link($max_page).'">'.$max_page.'</a></div>';
			}
			echo "</div>";
		}
	}
}

function display_pop_posts()
{
	global $post;
	query_posts('orderby=date&order=ASC&posts_per_page=5&tag=sidebar');
	if(have_posts())
	{
		while(have_posts())
		{
			the_post();
			$metavalue = get_post_meta($post->ID, 'thesis_post_image');
			?>
            <a href="<?php the_permalink(); ?>" title="<?php the_title(); ?>"><img src="/wp-content/themes/aishack_responsive/scripts/timthumb.php?src=<?php echo urlencode($metavalue[0]); ?>&w=260&h=75&q=75" class='sidebar-thumb' width='260' height='75' alt="<?php the_title(); ?>" /></a>
            <?php
		}
	}
}

add_action('init', 'aishack_init');
add_action('wp_head', 'aishack_favicon');
add_action('thematic_header', 'aishack_custom_nav', 6);
add_action('thematic_header', 'aishack_crumbs', 9);
//add_action('thematic_abovepost', 'aishack_postimage');
//add_action('thematic_belowpost', 'aishack_belowpost');
add_action('wp_head', 'aishack_header_scripts');
add_action('wp_footer', 'aishack_footer_scripts');
?>
