jQuery(document).ready(function($){
  var ref = "default";
  if(document.referrer){
    ref = document.referrer;
    m = ref.match(/^(http:\/\/[^\/]+)/i);
    if(m){
      ref = m[1].replace(".", "_");
    }
  }
   // bind close action
  $("#greet_block_close").click(function(){
    wpgb_set_cookie("wpgb_closed-"+ref,new Date(),365);
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
});
