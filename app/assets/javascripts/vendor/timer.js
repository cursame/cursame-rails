function startTimeSurvey(div) {
  var today = new Date();
  var h = today.getHours();
  var m = today.getMinutes();
  var s = today.getSeconds();
  m = checkTime(m);
  s = checkTime(s);
  var timerInExec = h+":"+m+":"+s;
  var dateStopTimer = $('#'+div).data('expire');
  if (timerInExec === dateStopTimer){
    $('#'+div).html(dateStopTimer);
    $('#'+div).removeClass('clock');
    $('#'+div).addClass('clock-end');
    $('#survey-submit').remove();
  }else{
    $('#'+div).html(timerInExec);
    var t = setTimeout(function(){startTimeSurvey(div)},500);
  }
}

function checkTime(i) {
  if (i<10) {i = "0" + i};
   return i;
}
