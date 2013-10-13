// display greet box when document is ready
jQuery(document).ready(function($){
  // set default referrer if none found
  var ref = "default";
  if(document.referrer){
    ref = document.referrer;
    m = ref.match(/^(http:\/\/[^\/]+)/i);
    if(m){
      ref = m[1].replace(".", "_");
    }
  }
  // send request
  $.ajax({
    type: "GET",
    url: "index.php",
    data: "wpgb_public_action=query&visit_delta="+wpgb_get_delta(ref)+"&closed="+wpgb_get_closed(ref)+"&logged_in="+wpgb_get_logged_in()+"&referrer="+encodeURIComponent(document.referrer)+"&url="+encodeURIComponent(document.location)+"&title="+encodeURIComponent(document.title),
    dataType: "html",
    success: function(resp) {
      if(resp != ''){
        // show greeting message
        $("#greet_block").hide().html(resp).fadeIn("def");
        // bind close action
        $("#greet_block_close").click(function(event){
          event.preventDefault();
          wpgb_set_cookie("wpgb_closed-"+ref,new Date(),wpgb_cookie_exp);
          wpgb_set_cookie("wpgb_closed-"+ref,new Date(),wpgb_cookie_exp);
          $("#greet_block").fadeOut("def");
        });
        // bind search action (if any)
        $("#greet_search_link").click(function(){
          action = $(this).attr("action");
          if(action == "show"){
            $("#greet_search_results").slideDown();
            $(this).attr("action","hide");
            $("#greet_search_link_text_show").hide();
            $("#greet_search_link_text_hide").show();
            $("#greet_search_text_show").hide();
            $("#greet_search_text_hide").show();
          }
          else if(action == "hide"){
            $("#greet_search_results").slideUp("fast");
            $(this).attr("action","show");
            $("#greet_search_link_text_show").show();
            $("#greet_search_link_text_hide").hide();
            $("#greet_search_text_show").show();
            $("#greet_search_text_hide").hide();
          }
        });
      }
    }
  });
  // set cookie
  wpgb_set_cookie("wpgb_visit_last-"+ref,new Date(),wpgb_cookie_exp);
});
