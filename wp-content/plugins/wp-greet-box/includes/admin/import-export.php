<script type="text/javascript">
function confirm_import() {
  var answer = confirm("<?php _e('All of your current WP Greet Box options will be overwritten by the imported value.  Are you sure you want to overwrite all settings?', $this->p->name); ?>");
  if(answer)
    return true;
  else
    return false;
}
</script>
<h2><?php _e('Export', $this->p->name) ?></h2>
<form method="post">
  <p><?php _e('This functionality will dump your entire WP Greet Box options into a file.', $this->p->name) ?></p>
  <p class="submit">
    <input type="submit" id="wpgb_options_export" name="wpgb_options_export" value="<?php _e('Export Options', $this->p->name) ?> &#187;" />
  </p>
</form>
<h2><?php _e('Import', $this->p->name) ?></h2>
<form method="post" enctype="multipart/form-data">
  <?php wp_nonce_field($this->p->name) ?>
  <p>
    <?php _e('This functionality will restore your entire WP Greet Box options from a file.', $this->p->name) ?><br/>
    <strong><?php _e('Make sure you\'ve done an export and backup the exported file before you try this!', $this->p->name) ?></strong>
  </p>
  <input type="file" id="wpgb_options_import_file" name="wpgb_options_import_file" size="40" /><br/>
  <?php wp_nonce_field($this->p->name) ?>
  <p class="submit">
    <input type="submit" id="wpgb_options_import" name="wpgb_options_import" value="<?php _e('Import Options', $this->p->name) ?> &#187;" onclick="return confirm_import()" />
  </p>
</form>
