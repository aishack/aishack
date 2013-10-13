<?php
  if ($this->p->o['messages'][$id]['disable']) {
    $a_action = 'activate';        $a_class = 'inactive';
    $a_text= __('Activate', $this->p->name);
  } else {
    $a_action = 'deactivate';
    $a_class = 'active';
    $a_text = __('Deactivate', $this->p->name);
  }
?>

<?php if ($wrap): ?>
  <div id="wpgb_message_<?php echo $id ?>" class="wpgb_message_<?php echo $a_class ?>">
    <div id="wpgb_message_row_<?php echo $id ?>" class="wpgb_message_row">
<?php endif; ?>
      <div class="wpgb_column_referrer"><?php echo $this->p->o['messages'][$id]['referrer'] ?></div>
	      <div class="wpgb_column_icon"><?php if ($this->p->o['messages'][$id]['icon'] != ''): ?><img src="<?php echo $this->p->o['messages'][$id]['icon'] ?>" alt="<?php echo $this->p->o['messages'][$id]['referrer'] ?> icon"/><?php endif; ?>&nbsp;</div>
      <div class="wpgb_column_message"><?php echo $this->p->o['messages'][$id]['text']?></div>
      <div class="wpgb_column_action">
        <div id="wpgb_loading_<?php echo $id ?>" class="wpgb_loading">
          <img src="<?php echo $this->p->c->get_plugin_url() ?>images/loading.gif" alt="<?php _e('loading...', $this->p->name) ?>"/>
        </div>
        <a href="#" class="wpgb_action" entry="<?php echo $id ?>" action="get_edit_form"><?php _e('Edit', $this->p->name) ?></a>&nbsp;|&nbsp;
        <a href="#" class="wpgb_action confirm" prompt="<?php _e('Are you sure you want to delete?', $this->p->name) ?>" entry="<?php echo $id ?>" action="delete"><?php _e('Delete', $this->p->name) ?></a>&nbsp;|&nbsp;
        <a href="#" class="wpgb_action" entry="<?php echo $id ?>" action="<?php echo $a_action ?>"><?php echo $a_text ?></a>
      </div>
      <div class="clear"></div>
<?php if ($wrap): ?>
    </div>
    <div id="wpgb_message_view_<?php echo $id ?>" class="wpgb_message_view" style="display:none"></div>
    <div class="clear"></div>
  </div>
<?php endif; ?>
