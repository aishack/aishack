<?php
  if($type == 'default'){
    $m = $this->p->o['message_default'];
  } else {
    $m = $this->p->o['message_noscript'];
    $type = 'noscript';
  }

  if ( $m['disable'] )
    $checkmark = 'checked';
  else
    $checkmark = '';
?>
<form id="wpgb_custom_message_form_<?php echo $type ?>" action="index.php" method="post">
  <?php if ($type == 'default'): ?>
    <input name="wpgb_message[show_till_close]" type="checkbox" <?php checked(1, $m['show_till_close'], true) ?> /> &nbsp; <?php _e('Continue to display greeting message until user first closes it (overrides visitor timeout if checked)', $this->p->name) ?><br/><br/>
    <?php _e('Visitor Timeout (minutes)', $this->p->name) ?>:<br/>
    <input name="wpgb_message[timeout]" type="text" class="wpgbusable" value="<?php echo esc_attr($m['timeout']) ?>"/><br/><br/>
  <?php endif; ?>
  <?php _e('Greeting Icon (optional)', $this->p->name) ?>:<br/>
  <input name="wpgb_message[icon]" type="text" class="wpgb_focusable widefat" value="<?php echo esc_attr($m['icon']) ?>"/><br/><br/>
  <?php _e('Greeting Icon Link (optional)', $this->p->name) ?>:<br/>
  <input name="wpgb_message[icon_link]" type="text" class="wpgb_focusable widefat" value="<?php echo esc_attr($m['icon_link']) ?>"/><br/><br/>
  <?php _e('Greeting message', $this->p->name) ?>:<br/>
  <textarea name="wpgb_message[text]" class="wpgb_focusable widefat" rows="4"><?php echo esc_attr($m['text']) ?></textarea><br/><br/>
  <p class="submit">
    <input type="submit" class="wpgb_submit" entry="<?php echo $type ?>" value="<?php _e('Save', $this->p->name) ?>"/>
    <input type="button" class="wpgb_cancel" entry="<?php echo $type ?>" value="<?php _e('Cancel', $this->p->name) ?>"/>
  </p>
  <input type="hidden" name="wpgb_id" value="<?php echo $type ?>"/>
  <input type="hidden" name="wpgb_action" value="update"/>
</form>
