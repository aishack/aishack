<?php
  if ($type == "default") {
    $m = $this->p->o['message_default'];
    $type = 'default';
  } else {        $m = $this->p->o['message_noscript'];
    $type = 'noscript';
  } 

  if ($m['disable']) {
    $a_action = 'activate';
    $a_class = 'inactive';
    $a_text= __('Activate', $this->p->name);
  } else {
    $a_action = 'deactivate';
    $a_class = 'active';
    $a_text = __('Deactivate', $this->p->name);
  }
?>

<?php if ($wrap): ?>
  <div id="wpgb_message_<?php echo $type ?>" class="wpgb_message_<?php echo $a_class ?>">
    <div id="wpgb_message_row_<?php echo $type ?>" class="wpgb_message_row">
<?php endif; ?>
      <div class="wpgb_column_referrer"><strong><?php echo strtoupper($type) ?></strong></div>
      <div class="wpgb_column_icon"><img src="<?php echo $m['icon'] ?>" alt="<?php _e('RSS icon', $this->p->name); ?>"/></div>
      <div class="wpgb_column_message"><?php echo $m['text'] ?></div>
      <div class="wpgb_column_action">
        <div id="wpgb_loading_<?php echo $type ?>" class="wpgb_loading">
          <img src="<?php echo $this->p->c->get_plugin_url() ?>images/loading.gif" alt="<?php _e('loading...', $this->p->name) ?>" />
        </div>
        <a href="#" class="wpgb_action" entry="<?php echo $type ?>" action="get_edit_form"><?php _e('Edit', $this->p->name) ?></a>&nbsp;|&nbsp;
        <a href="#" class="wpgb_action" entry="<?php echo $type ?>" action="<?php echo $a_action ?>"><?php echo $a_text ?></a>
      </div>
      <div class="clear"></div>
<?php if ($wrap): ?>
    </div>
    <div id="wpgb_message_view_<?php echo $type ?>" class="wpgb_message_view" style="display:none"></div>
    <div class="clear"></div>
  </div>
<?php endif; ?>
