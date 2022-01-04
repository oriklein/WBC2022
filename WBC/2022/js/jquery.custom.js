$(document).ready(function() { 
	$.showSmall();
	$.imgCenter();
	$.tagClick();
	$.menuNav();     });
		 
$(window).load(function () { 
	$.sectionMatch();
	$.menuMatch();
	$.menuNews();     });

jQuery.imgCenter = function() { $('img.center').each(function() { $(this).wrap('<div class="row center"></div>'); });     }

jQuery.showSmall = function() { 
	$('.show-small').click(function() { 
		var $next = $(this).next('.hide-small');
		if ($next.is(':hidden')) { $next.slideDown('fast'); $(this).html($(this).html().replace('Show', 'Hide')); } 
		else { $next.slideUp('fast'); $(this).html($(this).html().replace('Hide', 'Show')); }     });     }

jQuery.tagClick = function() { 
	$('.click').live('click', function() { 
		var $a = $(this).find('a:first');
		var $href = $a.attr('href');
		if ($href) { if ($a.attr('target') == '_blank') { window.open($href); } else { window.location = $href; } }
		else  { var $onclick = $a.attr('onclick'); var $function = new Function($onclick); $function(); }     });     }

jQuery.sectionMatch = function() { 
	$('body.small div.section-match div.article').css({'height': 'auto'});
	$('body.large div.section-match').each(function() { $(this).find('div.article').heightMatch('BOX'); });     }

jQuery.menuNews = function() { 
	$('body.small ul.menu-news div.article').css({'height': 'auto'});
	$('body.large ul.menu-news').each(function() { $(this).find('div.article').heightMatch('BOX'); });     }

jQuery.menuNav = function() { 
	$('body.large #header ul.menu-nav li.parent').live('click', function() { 
		var $ul = $(this).children('ul');
		if ($ul.is(':hidden')) { $ul.show(); } else { $ul.hide(); }     });     }
		
jQuery.menuMatch = function() { 
	$('body.small ul.menu-match div.article').css({'height': 'auto'});
	$('body.large ul.menu-match').each(function() { $(this).find('li').heightMatch('BOX'); });      }

