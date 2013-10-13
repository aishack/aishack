addComment = {
	moveForm : function(commId, parentId, respondId, postId) {
		var t = this, div, comm = t.I(commId), respond = t.I(respondId), cancel = t.I('cancel-comment-reply-link'), parent = t.I('comment_parent'), post = t.I('comment_post_ID');
      t.rmTiny();
		if ( ! comm || ! respond || ! cancel || ! parent )
			return;

		t.respondId = respondId;
		postId = postId || false;

		if ( ! t.I('wp-temp-form-div') ) {
			div = document.createElement('div');
			div.id = 'wp-temp-form-div';
			div.style.display = 'none';
			respond.parentNode.insertBefore(div, respond);
		}

		comm.parentNode.insertBefore(respond, comm.nextSibling);
		if ( post && postId )
			t.I('comment_post_ID').value = postId;
		t.I('comment_parent').value = parentId;
		cancel.style.display = '';

		cancel.onclick = function() {
			var t = addComment, temp = t.I('wp-temp-form-div'), respond = t.I(t.respondId);
         t.rmTiny();
			if ( ! temp || ! respond )
				return;

			t.I('comment_parent').value = '0';
			temp.parentNode.insertBefore(respond, temp);
			temp.parentNode.removeChild(temp);
			this.style.display = 'none';
			this.onclick = null;
			t.addTiny();
			return false;
		}
		
      t.addTiny();
	   
		try { t.I('comment').focus(); }
		catch(e) {}

		return false;
	},

	I : function(e) {
		return document.getElementById(e);
	},
	
	rmTiny : function() {
	   try {
		   tinyMCE.triggerSave();
		   tinyMCE.execCommand('mceFocus', false,'comment');
		   tinyMCE.execCommand('mceRemoveControl', false,'comment');
	   } catch(el) { console.error(el); }
   },

   addTiny : function() {
	   try { tinyMCE.execCommand('mceAddControl', false, 'comment');
	   } catch (e) { console.error(e); }
   }
}
