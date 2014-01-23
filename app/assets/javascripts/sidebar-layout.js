$(function() {

  /* Adjuts the sidebar components depending on the window Height
  ----------------------------------*/
  var sidebar       = $('div.global-sidebar'),
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

  var userHeader    = $('#user_nav');

  function adjustSidebar() {
    var winHeight = $(window).height();

    availableHeight = winHeight - staticHeight - coursesHeader - chatHeader;
    sidebar.height(winHeight);

    target1.height(availableHeight/2);
    target2.height(availableHeight/2)
  }

  function adjustUserHeader() {
    var winWidth      = $(window).width(),
        sidebarWidth  = sidebar.outerWidth(),
        finalWidth    = winWidth - sidebarWidth;

    if ( finalWidth > 720 ) {
      userHeader.width( finalWidth );
    } else {
      userHeader.width( 720 );
    }

  }

  adjustSidebar();
  adjustUserHeader();

  $(window).on('resize', function() {
    adjustSidebar();    
    adjustUserHeader();
  });

});