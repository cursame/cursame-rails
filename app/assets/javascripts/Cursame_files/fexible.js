var flexiBackground=function(){var bgImageSize={width:1280,height:750};var $window,$body,imageID="expando",tallClass='tall',wideClass='wide',$bgImage,$wrapper,img,url,imgAR;var ie6=($.browser.msie&&parseInt($.browser.version,10)<=6);var resizeAction=function(){var win={height:$window.height(),width:$window.width()};var winAR=win.width/win.height;if(win.width<bgImageSize.width&&win.height<bgImageSize.height){$body.removeClass(wideClass).removeClass(tallClass);}else if((win.w<bgImageSize.width&&win.height>=bgImageSize.height)||(winAR<imgAR)){$body.removeClass(wideClass).addClass(tallClass);$bgImage.css('left',Math.min(((win.width- bgImageSize.width)/2),0));}else if(win.width>=bgImageSize.width){$body.addClass(wideClass).removeClass(tallClass);$bgImage.css('left',0);}
if(ie6){$wrapper.css('height',win.height);}};return{initialize:function(){if(screen.availWidth<=bgImageSize.width||screen.availHeight<=bgImageSize.height){return;}
$window=$(window);$body=$('body');url=$body.css('background-image').replace(/^url\(("|')?|("|')?\);?$/g,'')||false;if(!url||url==="none"||url===""){return;}
imgAR=bgImageSize.width/bgImageSize.height;$bgImage=$('<img />').attr('src',url).attr('id',imageID);$wrapper=$('<div></div>').css({'overflow':'hidden','width':'100%','height':'100%','z-index':'-1'}).append($bgImage).appendTo($body);if(ie6){$wrapper.addClass('ie6fixed');}else{$wrapper.css({'position':'fixed','top':0,'left':0});}
$window.bind('resize',resizeAction);$window.trigger('resize');}};}();$(document).ready(flexiBackground.initialize);
