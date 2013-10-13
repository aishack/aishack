<?php /*
Example photoblog template for use with Yet Another Photoblog
Author: mitcho (Michael Yoshitaka Erlewine)
*/ ?>

<?php if ($related_query->have_posts()):?>
<div class="relatedposts">
<div class="post-divider"><span class="relatedpoststext">Related Posts</span></div>
<ol>
<?php while ($related_query->have_posts()) : $related_query->the_post(); ?>
		<li><a href="<?php the_permalink() ?>" rel="bookmark" title="<?php the_title_attribute(); ?>"><img class="thumb alignleft" src="/wp-content/themes/aishack/scripts/timthumb.php?src=<?php echo urlencode(get_post_meta($post->ID, 'thesis_post_image', true)); ?>&w=200&h=75&zc=1&q=100" width="200" height="75" alt="Thumbnail image for <?php the_title_attribute();?>"><?php the_title_attribute(); ?></a></li>
	<?php endwhile; ?>
</ol>
</div>
<div class="divider"></div>
<?php else: /*echo"<p>No related posts found.</p>";*/ endif; ?>
