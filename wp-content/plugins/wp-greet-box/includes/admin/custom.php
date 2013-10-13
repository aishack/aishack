<?php
  if(sizeof($this->p->o['messages']) > 0){
    echo(
      '<h3>'.__('Active Greeting Messages', $this->p->name).'</h3>'.
      '<div id="wpgb_messages_active" class="wpgb_wide">'.
        '<div class="wpgb_header">'.
          '<div class="wpgb_column_referrer">'.__('Referrer', $this->p->name).'</div>'.
          '<div class="wpgb_column_icon">'.__('Icon', $this->p->name).'</div>'.
          '<div class="wpgb_column_message">'.__('Message', $this->p->name).'</div>'.
          '<div class="wpgb_column_action">'.__('Action', $this->p->name).'</div>'.
        '</div>'.
        '<div class="clear"></div>'.
        '<div id="wpgb_add_bar_active" class="wpgb_add_bar">'.
          '<a href="#" class="wpgb_action" entry="active" action="get_add_form">'.__('Add new greeting message', $this->p->name).'</a>'.
          '<div id="wpgb_loading_active" class="wpgb_loading"><img src="'.$this->p->c->get_plugin_url().'images/loading.gif"/></div>'.
          '<div class="clear"></div>'.
        '</div>'
    );
    if(!$this->p->o['message_default']['disable']){
      $this->display_default_row('default');
    }
    if(!$this->p->o['message_noscript']['disable']){
      $this->display_default_row('noscript');
    }
    foreach($this->p->o['messages'] as $id => $m){
      if(!$m['disable']){
        $this->display_message_row($id);
      }
    }
    echo(
      '</div>'.
      '<div class="clear"></div><br/>'
    );
  }

  if(sizeof($this->p->o['messages']) > 0){
    echo(
      '<h3>'.__('Inactive Greeting Messages', $this->p->name).'</h3>'.
      '<div id="wpgb_messages_inactive" class="wpgb_wide">'.
        '<div class="wpgb_header">'.
          '<div class="wpgb_column_referrer">'.__('Referrer', $this->p->name).'</div>'.
          '<div class="wpgb_column_icon">'.__('Icon', $this->p->name).'</div>'.
          '<div class="wpgb_column_message">'.__('Message', $this->p->name).'</div>'.
          '<div class="wpgb_column_action">'.__('Action', $this->p->name).'</div>'.
        '</div>'.
        '<div class="clear"></div>'.
        '<div id="wpgb_add_bar_inactive" class="wpgb_add_bar">'.
          '<a href="#" class="wpgb_action" entry="inactive" action="get_add_form">'.__('Add new greeting message', $this->p->name).'</a>'.
          '<div id="wpgb_loading_inactive" class="wpgb_loading"><img src="'.$this->p->c->get_plugin_url().'images/loading.gif"/></div>'.
          '<div class="clear"></div>'.
        '</div>'
    );
    if($this->p->o['message_default']['disable']){
      $this->display_default_row('default');
    }
    if($this->p->o['message_noscript']['disable']){
      $this->display_default_row('noscript');
    }
    foreach($this->p->o['messages'] as $id => $m){
      if($m['disable']){
        $this->display_message_row($id);
      }
    }
    echo(
      '</div>'.
      '<div class="clear"></div>'
    );
  }
?>
