<?php
      global $post;
      $wpgb_hide = get_post_meta($post->ID, 'wpgb_hide', true);
?>
<div class="postbox">
  <h3><?php echo $this->p->name_proper ?></h3>
  <div class="inside">
    <p>
    <?php _e('Disable WP Greet Box on this post/page?', $this->name) ?>
    <input name="wpgb_hide" id="wpgb_hide" type="checkbox" <?php checked(true, $wpgb_hide, true) ?> />
    </p>
  </div><!--.inside-->
</div><!--.postbox-->
