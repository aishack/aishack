var xmlhttp;
var displocation;

 function ajaxreq(aurl, meth, parameters,act)
 {
//alert("heheness");
displocation = act;
if (window.XMLHttpRequest)
  {// code for Firefox, Opera, IE7, etc.
  xmlhttp=new XMLHttpRequest();
  }
else if (window.ActiveXObject)
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
if (xmlhttp!=null)
  {

	//alert("chicked");
	xmlhttp.onreadystatechange=stateChanged;
	xmlhttp.open(meth,aurl,true);
	if(parameters != null)
	{
		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	}
    xmlhttp.send(parameters);

  }
else
  {
  alert("Your browser does not support XMLHTTP.");
  }
}

 
 
 function stateChanged()
 {
	//alert("xmlhttp ready state " + xmlhttp.readyState);
 	if(xmlhttp.readyState==4)
	{
			document.getElementById(displocation).innerHTML = xmlhttp.responseText;
	}
	if(xmlhttp.readyState==1)
	{
		document.getElementById(displocation).innerHTML = "Processing...";
	}
			
 }
function getForm(objn)
{
	fobj = document.getElementById(objn);
   var str = "";
   for(var i = 0;i < fobj.elements.length;i++)
   {
				str += fobj.elements[i].name + "=" + fobj.elements[i].value + "&";
   }
   
   str = str.substr(0,(str.length - 1));
   //alert(str);
   return str;
}


function signupshow()
{
	document.getElementById('signupcont').style.display='block';
	document.getElementById('loginformcont').style.display='none';
}
function loginshow()
{
	document.getElementById('signupcont').style.display='none';
	document.getElementById('loginformcont').style.display='block';
}

function replyform(i)
{
	document.getElementById('question' + i).style.display='block';
}

function askquestion(formid)
{
	ajaxreq(qadmin_ajax_url,"POST",getForm(formid),formid);
}

function rateanswer(comment_id,rating,rating_html_id)
{
	ajaxreq(blogurl + '/wp-content/plugins/question-and-answer-forum/rateanswer.php?comment_id=' + comment_id + '&rating=' + rating,'GET',null,rating_html_id);
}
function bestans(comment_id,post_id,html_id)
{
	ajaxreq(qadmin_ajax_url + '?action=q_choose_bestans&comment=' + comment_id + '&post=' + post_id,'GET',null,html_id);
}
function quser_update(formid)
{
	ajaxreq(qadmin_ajax_url,"POST",getForm(formid),formid);
}