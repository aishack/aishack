<?php
  $m = $this->p->o['message_default'];

  if($status == 'active')
    $disable = 'off';
  else
    $disable = 'on';
?>

<div id="wpgb_add_<?php echo $status ?>" class="wpgb_add_form">
  <div id="wpgb_add_view_<?php echo $status ?>" class="wpgb_message_view" style="display:block">
    <form id="wpgb_add_form_<?php echo $status ?>" action="index.php" method="post"><?php _e('Referrer URL', $this->p->name) ?>:<br/>
      <input name="wpgb_message[referrer]" type="text" class="wpgb_focusable" value=""/><br/><br/>
      <input name="wpgb_message[show_till_close]" type="checkbox" <?php checked(1, $m['show_till_close'], true) ?> /> &nbsp; <?php _e('Continue to display greeting message until user first closes it (overrides visitor timeout if checked)', $this->p->name) ?><br/><br/>
      <?php _e('Visitor Timeout (minutes)', $this->p->name) ?>:<br/>
      <input name="wpgb_message[timeout]" type="text" class="wpgb_focusable" value="<?php echo esc_attr($m['timeout']) ?>"/><br/><br/>
      <?php _e('Greeting Icon (optional)', $this->p->name) ?>:<br/>
      <input name="wpgb_message[icon]" type="text" class="wpgb_focusable wpgb_wide" value="<?php echo esc_attr($m['icon']) ?>"/><br/><br/>
      <?php _e('Greeting Icon Link (optional)', $this->p->name)?>:<br/>
      <input name="wpgb_message[icon_link]" type="text" class="wpgb_focusable wpgb_wide" value="<?php echo esc_attr($m['icon_link']) ?>"/><br/><br/>
      <?php _e('Greeting message', $this->p->name) ?>:<br/>
      <textarea name="wpgb_message[text]" class="wpgb_focusable wpgb_wide" rows="4"><?php echo esc_attr($m['text']) ?></textarea><br/><br/>
      <input name="wpgb_message[disable]" type="hidden" value="<?php echo $disable ?>"/>
      <p class="submit">
        <input type="submit" class="wpgb_submit" entry="new" value="<?php _e('Add', $this->p->name) ?>" />
        <input type="button" class="wpgb_cancel" entry="active" value="<?php _e('Cancel', $this->p->name) ?>" />
      </p>
      <input type="hidden" name="wpgb_action" value="add"/>
    </form>
  </div>
</div>
