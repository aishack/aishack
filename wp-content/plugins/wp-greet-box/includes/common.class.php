<?php
if (!class_exists('WPGreetBoxCommon')) {

  class WPGreetBoxCommon {

    var $p = null;

    function WPGreetBoxCommon($plugin) {
      $this->p = $plugin;
    }

    // admin methods
  
    function a_check_version() {
      // check WP version
      global $wp_version;
      if (!empty($wp_version) && version_compare($wp_version, $this->p->required_wp_version, "<")) {
        add_action('admin_notices', array($this, 'a_notify_version'));
      }

      // check options and create/upgrade if necessary
      if (!$this->p->o) {
        $myFile = "log.txt";
        $fh = fopen($myFile, 'a');
        fwrite($fh, print_r(debug_backtrace(), true));
        fclose($fh);
        $this->p->o = $this->p->a->default_options();
        update_option($this->p->name, $this->p->o);
      } elseif($this->p->o && array_key_exists('version', $this->p->o) && version_compare($this->p->o['version'], $this->p->version, "<")) {
        $this->a_upgrade_options();
      } else {
        $this->a_check_orphan_options();
      }
    }

    function a_check_dir_writable($dir, $notify_cb) {
      if (is_writable($dir)) {
        return true;
      }
      else {
        // error and return false
        add_action('admin_notices', $notify_cb);
        return false;
      }
    }

    function a_check_orphan_options() {
      $options = get_option($this->p->name);
      if (!$options) {
        add_action('admin_notices', array($this , 'a_notify_orphan_options'));
        $this->a_upgrade_options();
        return true;
      } else {
        $default_options = $this->p->a->default_options();
        foreach( $default_options as $key => $value ) {
          if ( !array_key_exists($key, $options) ) {
            add_action('admin_notices', array($this , 'a_notify_orphan_options'));
            $this->a_upgrade_options();
            return true;
          }
        }
      }
      return false;
    }

    function a_notify($message, $error=false) {
      if ( !$error ) {
        echo '<div class="updated fade"><p>'.$message.'</p></div>';
      }
      else {
        echo '<div class="error"><p>'.$message.'</p></div>';
      }
    }
  
    function a_notify_version() {
      global $wp_version;
      $this->a_notify(
        sprintf(__('You are using WordPress version %s.', $this->p->name), $wp_version).' '.
        sprintf(__('%s recommends that you use WordPress %s or newer.', $this->p->name),
          $this->p->name_proper,
          $this->p->required_wp_version).' '.
        sprintf(__('%sPlease update!%s', $this->p->name),
          '<a href="http://codex.wordpress.org/Upgrading_WordPress">', '</a>'),
        true);
    }
  
    function a_notify_updated() {
      $this->a_notify(
        sprintf(__('%s options has been updated.', $this->p->name),
          $this->p->name_proper));
    }
  
    function a_notify_upgrade() {
      $this->a_notify(
        sprintf(__('%s options has been upgraded.', $this->p->name),
          $this->p->name_proper));
    }

    function a_notify_orphan_options() {
      $this->a_notify(
        sprintf('%s',
          __('Some option settings were missing (possibly from plugin upgrade).', $this->name)));
    }
  
    function a_notify_reset() {
      $this->a_notify(
        sprintf(__('%s options has been reset.', $this->p->name),
          $this->p->name_proper));
    }
  
    function a_notify_cache_cleared() {
      $this->a_notify(
        sprintf(__('%s cache has been cleared.', $this->p->name),
          $this->p->name_proper));
    }
  
    function a_notify_imported() {
      $this->a_notify(
        sprintf(__('%s options imported.', $this->p->name),
          $this->p->name_proper));
    }
  
    function a_notify_import_failed() {
      $this->a_notify(
        sprintf(__('%s options import failed!', $this->p->name),
          $this->p->name_proper), true);
    }
  
    function a_notify_import_failed_missing() {
      $this->a_notify(
        sprintf(__('Did not receive any file to be imported. %s options import failed!', $this->p->name),
          $this->p->name_proper), true);
    }
  
    function a_notify_import_failed_syntax() {
      $this->a_notify(
        sprintf(__('Found syntax errors in file being imported. %s options import failed!', $this->p->name),
          $this->p->name_proper), true);
    }

    function a_notify_invalid_api_key() {
      $this->a_notify(__('Please enter a valid API key!', $this->p->name), true);
    }
  
  
    function a_upgrade_options() {
      if (method_exists($this->p, 'a_upgrade_options')) {
        // run plugin's upgrade options function if it exists
        $this->p->a_upgrade_options();
      } elseif (method_exists($this->p->a, 'upgrade_options')) {
        // another flavor of upgrade options function
        $this->p->a->upgrade_options();
      } else {
        // else run generic upgrade options function
        $options = get_option($this->p->name);
        if ( !$options ) {
          update_option($this->p->name, $this->p->o);
        } else {
          $default_options = $this->p->a->default_options();
  
          // upgrade regular options
          foreach($default_options as $option_name => $option_value) {
            if(!isset($options[$option_name])) {
              $options[$option_name] = $option_value;
            }
          }
          $options['version'] = $this->p->version;
          // get rid of deprecated options if any
          foreach($default_options['deprecated'] as $option_name) {
            if(isset($options[$option_name])) {
              unset($options[$option_name]);
            }
          }
          update_option($this->p->name, $options);
        }
      }
      add_action('admin_notices', array($this, 'a_notify_upgrade'));
    }

    function a_reset_options() {
      $options = get_option($this->p->name);
      if ( !$options ) {
        update_option($this->p->name, $this->p->a->default_options());
      }
      else {
        update_option($this->p->name, $this->p->a->default_options());
      }
      add_action('admin_notices', array($this, 'a_notify_reset'));
    }

    function valid_syntax($code) {
      return @eval('return true;'.$code);
    }
  
    function a_import_options($file_var) {
      if (isset($_FILES[$file_var]) && !empty($_FILES[$file_var]['name'])) {
        $imported_options = join('', file($_FILES[$file_var]['tmp_name']));
        $code = '$imported_options = '.$imported_options.';';
        if ($this->valid_syntax($code)) {
          if (eval($code) === null) {
            update_option($this->p->name, $imported_options);
            add_action('admin_notices', array($this, 'a_notify_imported'));
          } else {
            add_action('admin_notices', array($this, 'a_notify_import_failed'));
          }
        } else {
          add_action('admin_notices', array($this, 'a_notify_import_failed_syntax'));
        }
      } else {
        add_action('admin_notices', array($this, 'a_notify_import_failed_missing'));
      }
    }
  
    function a_export_options($file_name) {
      $content = var_export($this->p->o, true);
      header('Cache-Control: public');
      header('Content-Description: File Transfer');
      header('Content-disposition: attachment; filename='.$file_name.'.txt');
      header('Content-Type: text/plain');
      header('Content-Transfer-Encoding: binary');
      header('Content-Length: '. mb_strlen($content, 'latin1'));
      echo $content;
      exit();
    }

    function a_register_scripts() {
      wp_register_script($this->p->name.'_easy_slider',
        $this->get_plugin_url().'js/easySlider1.5.js', array('jquery'));
    } 
      
    function a_enqueue_scripts() {
      wp_enqueue_script($this->p->name.'_easy_slider');
    } 
    
    function a_register_styles() {
      if (file_exists($this->get_plugin_dir().'css/style-admin.css')) {
        wp_register_style($this->p->name.'_style_admin',
          $this->get_plugin_url().'css/style-admin.css');
      }
    }

    function a_enqueue_styles() {
      wp_enqueue_style($this->p->name.'_style_admin');
    }

    function a_clear_cache() {
      $cache_location = $this->get_plugin_dir().'cache/';

      if(!$dh = @opendir($cache_location))
      {
        return;
      }
      while (false !== ($obj = readdir($dh)))
      {
        if($obj == '.' || $obj == '..')
        {
          continue;
        }
        @unlink(trailingslashit($cache_location) . $obj);
      }
      closedir($dh);

      $this->a_clear_super_cache();
    }

    function a_clear_super_cache() {
      if ( function_exists('prune_super_cache') ) {
        prune_super_cache(WP_CONTENT_DIR.'/cache/', true );
      }
    }
  
    // other methods
  
    // Localization support
    function load_text_domain() {
      // get current language
      $locale = get_locale();
  
      if(!empty($locale)) {
        // locate translation file
        $mofile = $this->get_plugin_dir().'lang/'.str_replace('_', '-', $this->p->name).'-'.$locale.'.mo';
        // load translation
        if(@file_exists($mofile) && is_readable($mofile)) load_textdomain($this->p->name, $mofile);
      }
    }
  
    function get_plugin_dir() {
      $path = trailingslashit(trailingslashit(WP_PLUGIN_DIR).plugin_basename(dirname(__FILE__)));
      $path = preg_replace('/(.*\/plugins\/[^\/]+?\/).+\//', '\1', $path);
      return $path;
    }
  
    function get_plugin_url() {
      $url = trailingslashit(trailingslashit(WP_PLUGIN_URL).plugin_basename(dirname(__FILE__)));
      $url = preg_replace('/(\/plugins\/[^\/]+?\/).+\//', '\1', $url);
      return $url;
    }

    function get_current_page_url() {
      $isHTTPS = (isset($_SERVER["HTTPS"]) && $_SERVER["HTTPS"] == "on");
      $port = (isset($_SERVER["SERVER_PORT"]) && ((!$isHTTPS && $_SERVER["SERVER_PORT"] != "80") || ($isHTTPS && $_SERVER["SERVER_PORT"] != "443")));
      $port = ($port) ? ':'.$_SERVER["SERVER_PORT"] : '';
      $url = ($isHTTPS ? 'https://' : 'http://').$_SERVER["SERVER_NAME"].$port.$_SERVER["REQUEST_URI"];
      return $url;
    }

    function make_checkbox($option, $default=false, $attrs=array()) {
      $attrs_str = ' ';
      foreach ($attrs as $name => $val) {
        $attrs_str .= $name.'="'.$val.'" ';
      }

      if ((!isset($option) && $default) || $option) {
        $checked = 'checked="checked"';
      } else {
        $checked = '';
      }

      return '<input type="checkbox" '.$attrs_str.$checked.' />';
    }

    function make_radio($option, $name, $value, $default=false, $label=null) {
      if ((!isset($option) && $default) || ($option == $value)) {
        $checked = 'checked="checked"';
        $classname = $this->p->name_dashed.'-active';
      } else {
        $checked = '';
        $classname = $this->p->name_dashed.'-inactive'; 
      }
      
      $out = '<label class="'.$classname.' label-'.$value.'"><input type="radio" name="'.$name.'" value="'.$value.'" '.$checked.' /> '.$label.'</label>';

      return $out;
    }
    
    function make_textfield($option, $name, $classname=null, $default=null, $label_before=null, $label_after=null, $advanced=false, $advanced_visible=false) {
      if (empty($option))
        $value = $default;
      else
        $value = $option;

      if ($advanced) {
        $classname = 'advanced-option '.$classname;
        if (!$advanced_visible)
          $advanced_style = 'style="display:none"';
        else
          $advanced_style = 'style="display:inline"';
      }
        
      return '<label class="'.$classname.'-textfield" '.$advanced_style.'>'.$label_before.' '.'<input type="text" name="'.$name.'" value="'.$value.'" /> '.$label_after.'</label>';
    }
    
    function make_select($option, $value, $default=null, $attrs=array()) {
      $attrs_str = ' ';
      foreach ($attrs as $name => $val) {
        $attrs_str .= $name.'="'.$val.'" ';
      }
      if (!strlen($value))
        $value = $default;
      $out = '<select'.$attrs_str.'>';
      foreach ($option as $sid => $svalue) {
        if ($value == $sid) {
					$selected = 'selected="selected"';
				} else {
					$selected = '';
				}
        $out .= '<option value="' . $sid . '" ' . $selected . '>' . $svalue . '</option>';
      }
      $out .= '</select>';

  		return $out;
    }

  }

}
?>
