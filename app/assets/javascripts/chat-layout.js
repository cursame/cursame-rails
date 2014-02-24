$(function() {

  var userBar         = $('.topbar'),
      chat            = $('.chat-wrap'),
      fixedHeight     = userBar.outerHeight();

  function adjustChat() {
    var winHeight       = $(window).height();

    if ( winHeight > 400 ) {
      chat.height( winHeight - fixedHeight );
    } else {
      chat.height(400);
    }

  };

  adjustChat();

  $(window).on('resize', function() {
    adjustChat();
  });
});