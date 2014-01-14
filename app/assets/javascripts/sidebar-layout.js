$(function() {

  var sidebar       = $('.global-sidebar'),
      user          = sidebar.find('div.user'),
      nav           = sidebar.find('div.sidebar-navigation'),
      courses       = sidebar.find('div.sidebar-courses'),
      chat          = sidebar.find('div.sidebar-chat'),
      footer        = sidebar.find('div.footer'),
      staticHeight  = user.outerHeight() + nav.outerHeight() + footer.outerHeight();

  console.log(staticHeight);

  function adjustSidebar() {
    var winHeight   = $(window).height();
    sidebar.height(winHeight);      
  }

  adjustSidebar();

  $(window).on('resize', function() {
    adjustSidebar();    
  });

});