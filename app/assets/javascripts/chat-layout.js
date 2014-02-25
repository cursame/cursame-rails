$(function() {

  var userBar           = $('.topbar'),
      chat              = $('.chat-wrap'),
      fixedHeight       = userBar.outerHeight(),
      sidebarTitle      = chat.find('.chat-sidebar-title'),
      sidebarContainer  = chat.find('.chat-sidebar-container');

  var messagesTitle     = $('.chat-converstion-title'),
      messagesContainer = $('.chat-main-container'),
      messagesNewContainer = $('.chat-new-message');

  function adjustChat() {
    var winHeight       = $(window).height();

    if ( winHeight > 400 ) {
      sidebarContainer.height( winHeight - fixedHeight - sidebarTitle.outerHeight() );
      chat.height( winHeight - fixedHeight );
    } else {
      chat.height(400);
    }

  };

  function adjustChatContainer() {
    $('.chat-main-container').height( $(window).height() - userBar.outerHeight() - $('.chat-converstion-title').outerHeight() - $('.chat-new-message').outerHeight() );
  };

  adjustChat();

  $(window).on('resize', function() {
    adjustChat();
    adjustChatContainer();
  });
});