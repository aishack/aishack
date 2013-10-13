// JavaScript Document
(function ($) {
		   
var one = $("#featured-1");
var two = $("#featured-2");
var three = $("#featured-3");

var controlOne = $("#controls #one");
var controlTwo = $("#controls #two");
var controlThree = $("#controls #three");
var currentFeatured = 1;		   
		
/*function runAutopager() {
    //return window.setInterval(featuredShowNext, 5000);
}

var autoPager = runAutopager();*/
		
function startup()
{
	initializeSlideshow();
	$('#siteinfo > div').click(gotoTop);
	$(".post-divider .uplink").click(gotoTop);
    $('#topnav ul').mobileMenu({topOptionText: 'Navigation', prependTo: '#topnav', switchWidth: 520});
	
	//displayAffiliateLink();
	
	//var interval_id;
//$(window).focus(function() {
  //  interval_id = window.setInterval(featuredShowNext, 5000);
//});

var autopager;
function startAutopager() {
    autopager = window.setInterval(featuredShowNext, 5000);
}
function stopAutopager() {
    window.clearInterval(autopager);
}

window.addEventListener('focus', startAutopager);    
window.addEventListener('blur', stopAutopager);

startAutopager();

}

function featuredShowFirst()
{
	two.fadeOut('fast');
	three.fadeOut('fast');
	two.hide();
	three.hide();
	
	one.fadeIn('fast');
	
	controlOne.addClass('selected');
	controlTwo.removeClass('selected');
	controlThree.removeClass('selected');
	currentFeatured = 1;
}

function featuredShowSecond()
{
	one.fadeOut('fast');
	three.fadeOut('fast');
	one.hide();
	three.hide();
	
	two.fadeIn('fast');
	
	controlOne.removeClass('selected');
	controlTwo.addClass('selected');
	controlThree.removeClass('selected');
	currentFeatured = 2;
}

function featuredShowThird()
{
	one.fadeOut('fast');
	two.fadeOut('fast');
	one.hide();
	two.hide();
	
	three.fadeIn('fast');
	
	controlOne.removeClass('selected');
	controlTwo.removeClass('selected');
	controlThree.addClass('selected');
	currentFeatured = 3;
}

var before = new Date();

function featuredShowNext()
{
	now = new Date();
    var elapsedTime = (now.getTime() - before.getTime());
	
	// If the elapsed time is more than 6000ms, we most probably returned from another tab
	if(elapsedTime<5500)
	{
		if(currentFeatured==1)
		{
			featuredShowSecond();
		}
		else if(currentFeatured==2)
		{
			featuredShowThird();
		}
		else if(currentFeatured==3)
		{
			featuredShowFirst();
		}
	}
	
	before = new Date();
}





function initializeSlideshow()
{
	two.hide();
	three.hide();
	
	controlOne.click(featuredShowFirst);
	controlTwo.click(featuredShowSecond);
	controlThree.click(featuredShowThird);
}

function gotoTop()
{
	var targetOffset = $('body').offset().top;
	$('html,body').animate({scrollTop: targetOffset}, 1000);
    return false;
}
 
function displayAffiliateLink()
{
	var temp = Math.random();
	$.ajaxSetup({cache: false});
	$("#the_aff").load("/wp-content/themes/aishack/scripts/affiliate.php?temp="+temp, function(){ $("#the_aff").show(); });
}
 
$(document).ready(startup);
})(jQuery);
