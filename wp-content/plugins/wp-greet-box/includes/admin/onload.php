<script type='text/javascript'>
<!--
jQuery(document).ready(function($){
  // action link clicks
  $("a.wpgb_action").livequery("click", function(e){
    e.preventDefault();
    a = this;
    if ($(a).is(".confirm") && !confirm($(a).attr("prompt")))
    {
      return false;
    }

    var id     = $(a).attr("entry");
    var action = $(a).attr("action");

    if(action == "cancel_add"){
      $(a).html("Add new greeting message").attr("action", "get_add_form");
      $("#wpgb_add_" + id).slideUp("fast");
      $("#wpgb_add_bar_" + id).fadeTo("fast", 1);
    }
    else if(action == "cancel_edit"){
      $(a).html("Edit").attr("action", "get_edit_form");
      $("#wpgb_message_view_" + id).slideUp("fast");
      $("#wpgb_message_row_" + id).fadeTo("fast", 1);
    }
    else{
      $("#wpgb_loading_" + id).fadeIn("fast", function(){
        $("#wpgb_message_view_" + id).hide();
        $.ajax({
          type  : "POST",
          url   : "admin-ajax.php",
          data  : { action : "<?php echo $this->p->name; ?>", _ajax_nonce: '<?php echo wp_create_nonce($this->p->name) ?>', wpgb_action : action, wpgb_id : id },
          success  : function(resp){
            switch(action){
              case "activate":
                $(a).html("Deactivate").attr("action", "deactivate");
                $("#wpgb_message_" + id).removeClass("wpgb_message_inactive").addClass("wpgb_message_active");
                $("#wpgb_message_" + id).appendTo($("#wpgb_messages_active"));
                $("#wpgb_message_row_" + id).fadeTo("slow", 1);
                $("a.wpgb_action[action='cancel_edit'][entry='" + id + "']").html("Edit").attr("action", "get_edit_form");
                break;
              case "deactivate":
                $(a).html("Activate").attr("action", "activate");
                $("#wpgb_message_" + id).removeClass("wpgb_message_active").addClass("wpgb_message_inactive");
                $("#wpgb_message_" + id).appendTo($("#wpgb_messages_inactive"));
                $("#wpgb_message_row_" + id).fadeTo("slow", 1);
                $("a.wpgb_action[action='cancel_edit'][entry='" + id + "']").html("Edit").attr("action", "get_edit_form");
                break;
              case "delete":
                $("#wpgb_message_" + id).fadeOut("slow").remove();
                break;
              case "get_add_form":
                $(a).html("Cancel").attr("action", "cancel_add");
                $("#wpgb_add_" + id).slideUp("fast").remove();
                $("#wpgb_add_bar_" + id).fadeTo("slow", 0.5).after(resp);
                // bind submit button
                $("#wpgb_add_form_" + id).submit(function(e){
                  e.preventDefault();
                  f = this;
                  $.ajax({
                    type    : "POST",
                    url     : "admin-ajax.php",
                    data    : $(f).serialize() + "&action=<?php echo $this->p->name ?>&_ajax_nonce=<?php echo wp_create_nonce($this->p->name) ?>",
                    success : function(resp){
                      $("#wpgb_add_" + id).slideUp("fast");
                      $("#wpgb_add_bar_" + id).fadeTo("fast", 1).after(resp);
                      $(a).html("Add new greeting message").attr("action", "get_add_form");
                    },
                    error   : function(resp){
                      alert("Error:" + resp);
                    }
                  });
                });
                // bind form cancel button
                $("#wpgb_add_form_" + id).find("input[class='wpgb_cancel']").click(function(e){
                  e.preventDefault();
                  $("#wpgb_add_" + id).slideUp("fast");
                  $("#wpgb_add_bar_" + id).fadeTo("fast", 1);
                  $(a).html("Add new greeting message").attr("action", "get_add_form");
                });
                break;
              case "get_edit_form":
                $(a).html("Cancel").attr("action", "cancel_edit");
                $("#wpgb_message_row_" + id).fadeTo("slow", 0.5);
                $("#wpgb_message_view_" + id).html(resp).slideDown("fast");
                // bind submit button
                $("#wpgb_custom_message_form_" + id).submit(function(e){
                  e.preventDefault();
                  f = this;
                  $.ajax({
                    type    : "POST",
                    url     : "admin-ajax.php",
                    data    : $(f).serialize() + "&action=<?php echo $this->p->name ?>&_ajax_nonce=<?php echo wp_create_nonce($this->p->name) ?>",
                    success : function(resp){
                      $("#wpgb_message_view_" + id).slideUp("fast");
                      $("#wpgb_message_row_" + id).html(resp).fadeTo("fast", 1);
                      $(a).html("Edit").attr("action", "get_edit_form");
                    },
                    error   : function(resp){
                      alert("Error:" + resp);
                    }
                  });
                });
                // bind form cancel button
                $("#wpgb_custom_message_form_" + id).find("input[class='wpgb_cancel']").click(function(e){
                  e.preventDefault();
                  $("#wpgb_message_view_" + id).slideUp("fast");
                  $("#wpgb_message_row_" + id).fadeTo("fast", 1);
                  $(a).html("Edit").attr("action", "get_edit_form");
                });
                break;
              default:
                break;
            }
            $("#wpgb_loading_" + id).fadeOut("fast");
          },
          error : function(resp){
            alert("Error:" + resp);
          }
        });
      });
    } // end else
  });
});
-->
</script>
