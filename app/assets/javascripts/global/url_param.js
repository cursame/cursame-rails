// url_param.js
if (typeof $URL === "undefined") {
  var $URL = {};
}

$URL.param = function(name) {
  var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
  if (results == null) {
    return null;
  } else {
    return decodeURI(results[1]) || 0;
  }
}

$(function(){
  var notice = $URL.param("notice"), 
      message = $URL.param("message");
  if (notice != null && message != null) {
    Notice(notice, message);
  }
});
