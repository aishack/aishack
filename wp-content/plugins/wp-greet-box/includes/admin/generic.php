<script type="text/javascript">
function confirm_reset() {
  var answer = confirm("<?php _e('All of your custom messages will also be reset.  Are you sure you want to reset all settings?', $this->p->name); ?>");
  if(answer)
    return true;
  else
    return false;
}

jQuery(document).ready(function($){
  $("#enable_related_post").click(function(e){
    if($(this).is(':checked')){
      $("#wpgb_related_post_options").slideDown();
      $(this).attr("checked",true);
    }
    else{
      $("#wpgb_related_post_options").slideUp();
      $(this).attr("checked",false);
    }
  });

  $("#wpgb_options_toggle_advanced").click(function(e){
    e.preventDefault();
    state = $(this).attr("state");
    if(state == "visible"){
      $("#wpgb_advanced_options").slideUp();
      $("#wpgb_options_reset").fadeOut();
      $(this).attr("state", "hidden");
      $(this).attr("value", "Show Advanced Options" + String.fromCharCode(187));
      $.ajax({
        type    : "POST",
        url     : "admin-ajax.php",
        data    : { action : "<?php echo $this->p->name ?>", _ajax_nonce: "<?php echo wp_create_nonce($this->p->name) ?>", wpgb_action : "hide_advanced_options" },
        success : function(resp){
          // do nothing visually
        },
        error   : function(resp){
          alert("Error:" + resp);
        }
      });
    }
    else{
      $("#wpgb_advanced_options").slideDown();
      $("#wpgb_options_reset").fadeIn();
      $(this).attr("state", "visible");
      $(this).attr("value", "Hide Advanced Options" + String.fromCharCode(187));
      $.ajax({
        type    : "POST",
        url     : "admin-ajax.php",
        data    : { action : "<?php echo $this->p->name ?>", _ajax_nonce: "<?php echo wp_create_nonce($this->p->name) ?>", wpgb_action : "show_advanced_options" },
        success : function(resp){
          // do nothing visually
        },
        error   : function(resp){
          alert("Error:" + resp);
        }
      });
    }
  });
});
</script>
<?php
  if ($this->p->o['show_related']) {
    $show_related_style = 'block';
  }
  else {
    $show_related_style = 'none';
  }
    
  if ($this->p->o['position'] == 'after') {
    $position_opt1 = '';
    $position_opt2 = 'selected';
  }
  else {
    $position_opt1 = 'selected';
    $position_opt2 = '';
  }

  if ($this->p->o['related_position'] == 'after') {
    $related_position_opt1 = '';
    $related_position_opt2 = 'selected';
  }
  else {
    $related_position_opt1 = 'selected';
    $related_position_opt2 = '';
  }

  if ($this->p->o['show_advanced_options']) {
    $advanced_style = 'style="display:inline"';
    $advanced_toggle_text = __('Hide', $this->p->name);
    $advanced_toggle_state = 'visible';
  }
  else {
    $advanced_style = 'style="display:none"';
    $advanced_toggle_text = __('Show', $this->p->name);
    $advanced_toggle_state = 'hidden';
  }
?>

<form method="post">
  <?php wp_nonce_field($this->p->name) ?>

  <h2><?php _e('Support this plugin!', $this->p->name) ?></h2>

  <p><label>
    <?php _e('Display \'Powered by WP Greet Box\' link at the bottom right corner of the greeting message', $this->p->name) ?> &nbsp;
    <input name="wpgb_options_general[show_link]" value="on" type="radio" <?php checked(1, $this->p->o['show_link']) ?>/>
  </label></p>

  <p><label>
    <?php printf(__('Do not display \'Powered by WP Greet Box\' link.  (%sDonations are appreciated!%s)', $this->p->name), '<a href="http://omninoggin.com/donate">', '</a>') ?> &nbsp;
    <input name="wpgb_options_general[show_link]" value="off" type="radio" <?php checked(0, $this->p->o['show_link']) ?>/>
  </label></p>

  <h2><?php _e('General Configuration', $this->p->name) ?></h2>

  <p><label>
    <?php _e('Enable rounded corners', $this->p->name) ?> &nbsp;
    <input name="wpgb_options_general[corners]" type="checkbox" <?php checked(1, $this->p->o['corners']) ?>/> &nbsp;
    (<?php _e('CSS3 browsers only', $this->p->name) ?>) 
  </label></p>

  <p><label>
    <?php _e('Enable drop shadow', $this->p->name) ?> &nbsp;
    <input name="wpgb_options_general[drop_shadow]" type="checkbox" <?php checked(1, $this->p->o['drop_shadow']) ?>/> &nbsp;
    (<?php _e('CSS3 browsers only', $this->p->name) ?>)
  </label></p>

  <p><label>
    <?php _e('Automatically show greeting message on posts', $this->p->name) ?> &nbsp;
    <input name="wpgb_options_general[show_post]" type="checkbox" <?php checked(1, $this->p->o['show_post']) ?>/> &nbsp;
    (<?php _e('uncheck for manual insertion', $this->p->name) ?>)
  </label></p>

  <p><label>
    <?php _e('Automatically show greeting message on pages', $this->p->name) ?> &nbsp;
    <input name="wpgb_options_general[show_page]" type="checkbox" <?php checked(1, $this->p->o['show_page']) ?>/> &nbsp;
    (<?php _e('uncheck for manual insertion', $this->p->name) ?>)
  </label></p>

  <p><label>
    <?php _e('Automatically show greeting message on homepage', $this->p->name) ?> &nbsp;
    <input name="wpgb_options_general[show_home]" type="checkbox" <?php checked(1, $this->p->o['show_home']) ?>/> &nbsp;
    (<?php _e('uncheck for manual insertion', $this->p->name) ?>)
  </label></p>

  <p><label>
    <?php _e('Allow users to close the greeting message', $this->p->name) ?> &nbsp;
    <input name="wpgb_options_general[can_close]" type="checkbox" <?php checked(1, $this->p->o['can_close']) ?>/>
  </label></p>

  <p><label>
    <?php _e('Have icon link open a new browser window (same as target=\'_blank\')', $this->p->name) ?> &nbsp;
    <input name="wpgb_options_general[target_blank]" type="checkbox" <?php checked(1, $this->p->o['target_blank']) ?>/>
  </label></p>

  <p><label>
    <?php _e('Position greeting message', $this->p->name) ?> &nbsp;
    <select name="wpgb_options_general[position]">
      <option value="before" <?php echo $position_opt1 ?>><?php _e('before', $this->p->name) ?></option>
      <option value="after" <?php echo $position_opt2 ?>><?php _e('after', $this->p->name) ?></option>
    </select> &nbsp;
    <?php _e('the post/page.', $this->p->name) ?>
  </label></p>

  <h2><?php _e('Related Post Options', $this->p->name) ?></h2>

  <p><label>
    <?php _e('Detect keywords from search engines referrers and display related posts', $this->p->name) ?> &nbsp;
    <input id="enable_related_post" name="wpgb_options_general[show_related]" type="checkbox" <?php checked(1, $this->p->o['show_related']) ?>/> &nbsp;
  </label></p>

  <span id="wpgb_related_post_options" style="display:<?php echo $show_related_style ?>">

  <p><label>
    <?php _e('Position related posts', $this->p->name) ?> &nbsp;
    <select name="wpgb_options_general[related_position]">
      <option value="before" <?php echo $related_position_opt1 ?>><?php _e('before', $this->p->name) ?></option>
      <option value="after" <?php echo $related_position_opt2 ?>><?php _e('after', $this->p->name) ?></option>
    </select><?php _e('the greeting message.', $this->p->name) ?>
  </label></p>

  <p><label>
    <?php _e('Show post excerpt in related posts', $this->p->name) ?> &nbsp;
    <input name="wpgb_options_general[show_related_excerpt]" type="checkbox" <?php checked(1, $this->p->o['show_related_excerpt']) ?>/>
  </label></p>

  <p><label>
    <?php _e('Expand related posts by default', $this->p->name) ?> &nbsp;
    <input name="wpgb_options_general[open_related]" type="checkbox" <?php checked(1, $this->p->o['open_related']) ?>/>
  </label></p>

  <p><label>
    <?php printf(__('Limit related posts to %s posts', $this->p->name), '<input name="wpgb_options_general[related_limit]" id="related-limit" type="text" class="wpgreetbox-focusable" size="5" value="'.esc_attr($this->p->o['related_limit']).'"/>') ?>
  </label></p>

  <p><label>
    <?php printf(__('Limit related post excerpts to %s words', $this->p->name), '<input name="wpgb_options_general[related_excerpt_len]" id="related-excerpt-len" type="text" class="wpgreetbox-focusable" size="5" value="'.esc_attr($this->p->o['related_excerpt_len']).'"/>') ?>
  </label></p>

  </span>

  <div id="wpgb_advanced_options" <?php echo $advanced_style ?>>

  <h2><?php _e('Advanced Options', $this->p->name) ?></h2>

  <p><label>
    <?php _e('Enable compatibility with cache plugins', $this->p->name) ?> &nbsp;
    <input name="wpgb_options_general[cache_compatible]" id="cache-compatible" type="checkbox" <?php checked(1, $this->p->o['cache_compatible']) ?>/> (<?php _e('If check, WP Greet Box will use Javascript to load the greeting message', $this->p->name) ?>)
  </label></p>

  <p><label>
    <?php _e('Show greeting message to logged in users', $this->p->name) ?> &nbsp;
    <input name="wpgb_options_general[show_logged_in]" id="show-logged-in" type="checkbox" <?php checked(1, $this->p->o['show_logged_in']) ?>/>
  </label></p>

  <p><label>
    <?php _e('Debug mode', $this->p->name) ?> &nbsp;
    <input name="wpgb_options_general[debug]" id="debug" type="checkbox" <?php checked(1, $this->p->o['debug']) ?>/> (<?php _e('Will always show greet box regardless of settings', $this->p->name) ?>)
  </label></p>

  <p><label>
    <?php printf(__('Enable %s', $this->p->name), 'css/wp-greet-box.css') ?> &nbsp;
    <input name="wpgb_options_general[enable_css]" id="enable-css" type="checkbox" <?php checked(1, $this->p->o['enable_css']) ?>/> (<?php _e('uncheck to manually manage your own CSS', $this->p->name) ?>
  </label></p>

  <p><label>
    <?php printf(__('Enable %s and %s', $this->p->name), 'js/functions.js', 'js/onload.js') ?>
    <input name="wpgb_options_general[enable_js]" id="enable-js" type="checkbox" <?php checked(1, $this->p->o['enable_js']) ?>/> (<?php _e('uncheck to manually manage your own JS', $this->p->name) ?>)
  </label></p>

  <p><label>
    <?php _e('Your RSS feed URL. (replaces [[rss-link]] in greeting messages with this)', $this->p->name) ?><br/>
    <input name="wpgb_options_general[rss_link]" id="rss-url" type="text" class="wpgreetbox-focusable" size="60" value="<?php echo esc_attr($this->p->o['rss_link']) ?>"/>
  </label></p>

  <p><label>
    <?php _e('Your \'Subscribe via Email\' URL. (replaces [[email-link]] in greeting messages this)', $this->p->name) ?><br/>
    <input name="wpgb_options_general[email_link]" id="email-url" type="text" class="wpgreetbox-focusable" size="60" value="<?php echo esc_attr($this->p->o['email_link']) ?>"/>
  </label></p>

  <p><label>
    <?php _e('HTML code to display before the greeting box.', $this->p->name) ?><br/>
    <textarea name="wpgb_options_general[before_greet]" id="before-greet" class="wpgreetbox-focusable widefat" rows="2"><?php echo esc_attr($this->p->o['before_greet']) ?></textarea>
  </label></p>

  <p><label>
    <?php _e('HTML code to display after the greeting box.', $this->p->name) ?><br/>
    <textarea name="wpgb_options_general[after_greet]" id="after-greet" class="wpgreetbox-focusable widefat" rows="2"><?php echo esc_attr($this->p->o['after_greet']) ?></textarea>
  </label></p>

  <p><label><?php _e('HTML code to display before the image in the greeting box.', $this->p->name) ?><br/>
    <textarea name="wpgb_options_general[before_icon]" id="before-icon" class="wpgreetbox-focusable widefat" rows="2"><?php echo esc_attr($this->p->o['before_icon']) ?></textarea>
  </label></p>

  <p><label>
    <?php _e('HTML code to display after the image in the greeting box.', $this->p->name) ?><br/>
    <textarea name="wpgb_options_general[after_icon]" id="after-icon" class="wpgreetbox-focusable widefat" rows="2"><?php echo esc_attr($this->p->o['after_icon']) ?></textarea>
  </label></p>

  <p><label>
    <?php _e('HTML code to display before the text in the greeting box.', $this->p->name) ?><br/>
    <textarea name="wpgb_options_general[before_text]" id="before-text" class="wpgreetbox-focusable widefat" rows="2"><?php echo esc_attr($this->p->o['before_text']) ?></textarea>
  </label></p>

  <p><label><?php _e('HTML code to display after the text in the greeting box.', $this->p->name) ?><br/>
    <textarea name="wpgb_options_general[after_text]" id="after-text" class="wpgreetbox-focusable widefat" rows="2"><?php echo esc_attr($this->p->o['after_text']) ?></textarea>
  </label></p>

  </div>

  <p class="submit">
    <input type="submit" name="wpgb_options_general_submit" value="<?php _e('Update Options', $this->p->name) ?> &#187;" />
    <?php if(isset($_GET['debug']) && $_GET['debug'] > 0): ?>
      <input type="submit" name="wpgb_options_upgrade" value="<?php _e('Upgrade Options', $this->p->name) ?> &#187;"/>
    <?php endif; ?>
    <input type="submit" id="wpgb_options_reset" name="wpgb_options_reset" value="<?php _e('Reset ALL Options', $this->p->name) ?> &#187;" onclick="return confirm_reset()" <?php echo $advanced_style ?>/>
    <input type="button" id="wpgb_options_toggle_advanced" name="wpgb_options_toggle_advanced" state="<?php echo $advanced_toggle_state ?>" value="<?php echo $advanced_toggle_text ?> <?php _e('Advanced Options', $this->p->name) ?> &#187;"/>
  </p>

</form>
