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
    messagesContainer.height( $(window).height() - userBar.outerHeight() - messagesTitle.outerHeight() - messagesNewContainer.outerHeight() );
  };

  adjustChat();

  $(window).on('resize', function() {
    adjustChat();
    adjustChatContainer();
  });
});