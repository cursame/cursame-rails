$(function() {

  /* Adjuts the sidebar components depending on the window Height
  ----------------------------------*/
  var sidebar       = $('.global-sidebar'),
      user          = sidebar.find('div.user'),
      nav           = sidebar.find('div.sidebar-navigation'),
      courses       = sidebar.find('div.sidebar-courses'),
      coursesHeader = courses.find('div.sidebar-section-header').outerHeight(),
      chat          = sidebar.find('div.sidebar-chat'),
      chatHeader    = chat.find('div.sidebar-section-header').outerHeight(),
      footer        = sidebar.find('div.global-footer'),
      staticHeight  = user.outerHeight() + nav.outerHeight() + footer.outerHeight(),

      target1       = courses.find('.sidebar-section-main'),
      target2       = chat.find('.sidebar-section-main');

  function adjustSidebar() {
    var winHeight   = $(window).height();

    availableHeight = winHeight - staticHeight - coursesHeader - chatHeader;
    sidebar.height(winHeight);

    target1.height(availableHeight/2);
    target2.height(availableHeight/2)
  }

  adjustSidebar();

  $(window).on('resize', function() {
    adjustSidebar();    
  });

});