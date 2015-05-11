function startTimeSurvey(div) {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    
    m = checkTime(m);
    s = checkTime(s);
   
    var OmGTimer = h+":"+m+":"+s;
    var PmGStopTimer = $('#'+div).data('expire');

    if (OmGTimer == PmGStopTimer){
    	$('#'+div).html(PmGStopTimer);
    	$('#'+div).removeClass('clock');
    	$('#'+div).addClass('clock-end');
    	$('#survey-submit').remove();
    }else{
	    $('#'+div).html(OmGTimer);
	    var t = setTimeout(function(){startTimeSurvey(div)},500);	
    }
    
}

function checkTime(i) {
    if (i<10) {i = "0" + i};  
     return i;
}