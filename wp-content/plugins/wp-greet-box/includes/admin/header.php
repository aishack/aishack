<div class="wrap omni_admin_content">
  <h2><?php echo sprintf(__('%s Options', $this->p->name), $this->p->name_proper); ?></h2>
  <div>
    <a href="<?php echo preg_replace('/&wpgb-page=[^&]*/', '', $_SERVER['REQUEST_URI']); ?>"><?php _e('Greeting Messages', $this->p->name); ?></a>
    &nbsp;|&nbsp;
    <a href="<?php echo preg_replace('/&wpgb-page=[^&]*/', '', $_SERVER['REQUEST_URI']).'&wpgb-page=exclude'; ?>"><?php _e('Exclusion Rules', $this->p->name); ?></a>
    &nbsp;|&nbsp;
    <a href="<?php echo preg_replace('/&wpgb-page=[^&]*/', '', $_SERVER['REQUEST_URI']).'&wpgb-page=generic'; ?>"><?php _e('General Configuration', $this->p->name); ?></a>
    &nbsp;|&nbsp;
    <a href="<?php echo preg_replace('/&wpgb-page=[^&]*/', '', $_SERVER['REQUEST_URI']).'&wpgb-page=import-export'; ?>"><?php _e('Import/Export', $this->p->name); ?></a>
    &nbsp;|&nbsp;
    <a href="<?php echo $this->p->homepage; ?>"><?php _e('Documentation', $this->p->name); ?></a>
  </div>
  <div style="clear:both;"></div>
  <div class="omni_admin_main"> 
