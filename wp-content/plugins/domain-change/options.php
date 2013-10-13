<?php
	if(!is_admin()){
		die(__('access deny!'));
	}
	
	$optionsArray = get_option($domainChange->currentOptionsArray);

	if(isset($_POST['oldDomain'])){
		$oldDomain = strtolower(trim($_POST['oldDomain']));	
			$optionsArray['oldDomain'] = $oldDomain;
	}

	// if isset $_POST['isRedirect'], it means that the isredirect is checked,
	// so it 
	if(isset($_POST['isRedirect'])){
		if($_POST['isRedirect'] == 'enable'){
			$optionsArray['isRedirect'] = true;
		}else{
			$optionsArray['isRedirect'] = false;
		}
		
	}

	update_option($domainChange->currentOptionsArray, $optionsArray);

	$enable = '';
	$disable = '';
	if($optionsArray['isRedirect'] === true){
		$enable = 'checked="checked"';
	}else{
		$disable = 'checked="checked"';
	}

	
?>
<div class="wrap">
<h2>Domain Change Setting</h2>

<form method="post" action="<?php //echo $_SERVER["REQUEST_URI"]; ?>">
	<table class="form-table">
		
		<tr valign="top">
			<th scope="row"><label for="oldDomain">Old Blog Siteurl</label></th>
			<td><input type="text" name="oldDomain" id="oldDomain" value="<?php echo $optionsArray['oldDomain'];?>" class="regular-text"/>
			<label for="oldDomain">
			<span class="setting-description">
				<?php echo __('fill in your old blog siteurl,example:<strong>http://www.old.com/blog/</strong>');?>
			</span></label></td>
		</tr>

		<tr valign="top">
			<th scope="row">Open feature</th>
			<td><label><input type="radio" name="isRedirect" value="enable" <?php echo $enable?>>Enable</input></label>
				<label><input type="radio" name="isRedirect" value="disable" <?php echo $disable?>>Disable</input></label><br />
				<span class="setting-description">
					<?php echo __('if select disable, this plugin will not work.'); ?>
				</span>
			</td>
		</tr>

	</table>
<p class="submit">
<input type="submit" class="button-primary" value="<?php _e('Save Changes') ?>" ></input>
</p>

</form>
</div>