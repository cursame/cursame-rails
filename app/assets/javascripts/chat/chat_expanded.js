$(function() {
  Chat.adjustExpandedChatSidebar();
  Chat.adjustExpandedChatContainer();

  $(window).on('resize', function() {
    Chat.adjustExpandedChatSidebar();
    Chat.adjustExpandedChatContainer();
  });
});