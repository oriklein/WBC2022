//load
$('html').addClass('js');

$(document).ready(function() { $('html').addClass('js-ready'); $.deviceGet(); $.pageResize();     });
$(window).load(function () { $('html').addClass('js-load'); $.pageResize();    });
$(window).resize(function() { $.pageResize(); });
$(window).bind('orientationchange', function(){ $.pageResize(); });	

jQuery.deviceGet = function () { 
	if (navigator.userAgent.match(/(iPhone|iPod|iPad|Android|BlackBerry)/)) { $('html').addClass('mobile'); }
	else { $('html').addClass('desktop'); }
	if (navigator.userAgent.match(/(iPhone|iPod)/)) { $('html').addClass('mobile-iphone'); }
	else if (navigator.userAgent.match(/(iPad)/)) { $('html').addClass('mobile-ipad'); }     }
	
jQuery.pageResize = function() { 
	var $body = $('body');
	if ($body.is('.mobileiphone, mobileipad')) { var $orientation = 'portrait'; if (Math.abs(window.orientation) == 90) { $orientation = 'landscape'; $body.removeClass('portrait').addClass('landscape'); } else { $orientation = 'portrait'; $body.removeClass('landscape').addClass('portrait'); } }
	var $width = $(window).width();
	if ($orientation == 'portrait') { $width = window.screen.width; }
	else if ($orientation == 'landscape') { $width = window.screen.height; }
	if ($width >= 960) { $body.removeClass('small xsmall').addClass('large'); }
	else if ($width >= 480) { $body.removeClass('large xsmall').addClass('small'); }
	else { $body.removeClass('large').addClass('xsmall small'); }
	$.sectionMatch();
	$.menuMatch();
	$.menuNews();     }

//style
jQuery.fn.classSwitch = function($add, $remove) { $(this).removeClass($remove); $(this).addClass($add); }
jQuery.fn.cssMargin = function() { return $(this).css('margin-top') + ' ' + $(this).css('margin-right') + ' ' + $(this).css('margin-bottom') + ' ' + $(this).css('margin-left'); }
jQuery.fn.cssPadding = function() { return $(this).css('padding-top') + ' ' + $(this).css('padding-right') + ' ' + $(this).css('padding-bottom') + ' ' + $(this).css('padding-left'); }
jQuery.fn.cssInt = function($attr) { var $value = parseInt($(this).css($attr)); if (isNaN($value)) { $value = 0; } return $value; }
jQuery.fn.cssOpacity = function($value) { $(this).css({opacity: $value}); }
jQuery.fn.cssHeight = function($value) { $(this).css({height: $value + 'px'}); }
jQuery.fn.cssWidth = function($value) { $(this).css({width: $value + 'px'}); }
jQuery.fn.cssZindex = function($value) { $(this).css({zIndex: $value}); }

//height & width
jQuery.fn.heightMatch = function($attr) { $(this).css({'height': 'auto'}); var $height = 0; $(this).each(function() { if ($(this).heightPlus($attr) > $height) { $height = $(this).heightPlus($attr); } }); $(this).css({'height': $height + 'px'}); return $height; }
jQuery.fn.heightPlus = function ($attr) { 
	if ($(this).css('display') == 'none') { var $thishidden = true; $(this).show(); }
	var $parenthidden = $(this).parents().filter(function() { return $(this).css('display') == 'none'; });
	$parenthidden.show();
	var $height = 0;
	if ($attr == 'BOX') { $attr = 'bhp'; }
	else if ($attr == 'INNER') { $attr = 'hp'; }
	else if ($attr == 'OUTER') { $attr = 'bhmp'; }
	else if ($attr == 'POS') { $attr = 'bhmpy'; }
	else { $attr = 'h'; }
	var $array = $attr.split('');
	for ($item in $array) {
		if ($array[$item] == 'b') { $height += ($(this).cssInt('border-bottom-width') + $(this).cssInt('border-top-width')); }
		else if ($array[$item] == 'h') { $height += $(this).height(); }
		else if ($array[$item] == 'm') { $height += ($(this).cssInt('margin-bottom') + $(this).cssInt('margin-top')); }
		else if ($array[$item] == 'p') { $height += ($(this).cssInt('padding-bottom') + $(this).cssInt('padding-top')); }
		else if ($array[$item] == 'y') { if ($(this).cssInt('bottom') > 0) { $height += $(this).cssInt('bottom'); } else if ($(this).cssInt('top') > 0) { $height += $(this).cssInt('top'); } }     }
	if ($parenthidden) { $parenthidden.hide(); }
	if ($thishidden) { $(this).hide(); }
	return $height;     } 
		
jQuery.fn.iframeHeight = function() {
	
	var $iframe = $(this).contentDocument || $(this).contentWindow.document;
	alert ('length' + $iframe.length);
	if ($iframe) { $(this).css({'height': $iframe.document.documentElement.scrollHeight || $iframe.document.body.scrollHeight}); }     }

		