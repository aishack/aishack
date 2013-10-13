<form method="post">
  <?php wp_nonce_field($this->p->name) ?>
  <h2><?php _e('Exclusion Rules', $this->p->name) ?></h2>

  <p><label for="exclude-referrer">
    <?php _e('List referral URLs that you do not want to show a greeting message to (line delimited).', $this->p->name) ?><br/>
    <textarea name="wpgb_options_exclusion[exclude_referrer]" id="exclude-referrer" class="wpgreetbox-focusable widefat" rows="8"><?php echo esc_attr($this->p->o['exclude_referrer']) ?></textarea>
  </label></p>

  <p><label for="show_post">
    <?php _e('Treat each line as a regular expression', $this->p->name) ?>
    &nbsp;<input name="wpgb_options_exclusion[regex_rules]" type="checkbox" <?php checked(true, $this->p->o['regex_rules']) ?>/>
  </label></p>

  <p class="submit">
     <input type="submit" name="wpgb_options_exclusion_submit" value="<?php _e('Update Options', $this->p->name) ?> &#187;" />
  </p>
</form>
