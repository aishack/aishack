var wpgb_cookie_exp = 365;

function wpgb_get_cookie(c_name) {
  if (document.cookie.length>0) {
    c_start=document.cookie.indexOf(c_name + "=");
    if (c_start!=-1) {
      c_start=c_start + c_name.length+1;
      c_end=document.cookie.indexOf(";",c_start);
      if (c_end==-1) c_end=document.cookie.length;
      return unescape(document.cookie.substring(c_start,c_end));
    }
  }
  return "";
}

function wpgb_set_cookie(c_name,value,expiredays) {
  var exdate = new Date();
  exdate.setDate(exdate.getDate()+expiredays);
  document.cookie=c_name+ "=" +escape(value)+";path="+"/"+
  ((expiredays==null) ? "" : ";expires="+exdate.toGMTString());
}

function wpgb_delete_cookie ( c_name )
{
  var now = new Date ();
  now.setTime ( now.getTime() - 1 );
  document.cookie = c_name += "=; expires=" + now.toGMTString();
}

function wpgb_get_delta(ref) {
  var visit_delta;
  var visit_last = wpgb_get_cookie("wpgb_visit_last-"+ref);

  if(visit_last==null || visit_last=="") {
    visit_delta = -1;
  }
  else {
    visit_last = new Date(visit_last);
    visit_delta = Math.round((new Date() - visit_last)/(1000 * 60));
  }
  return visit_delta;
}

function wpgb_get_closed(ref) {
  var closed = wpgb_get_cookie("wpgb_closed-"+ref);
  if(closed==null || closed=="") {
    return ""
  }
  else {
    return "true"
  }
}

function wpgb_get_logged_in() {
  var logged_in = wpgb_get_cookie("wpgb_logged_in");
  if(logged_in==null || logged_in=="") {
    return ""
  }
  else {
    return "true"
  }
}
