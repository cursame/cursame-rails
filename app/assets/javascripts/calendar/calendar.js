$(function() {

  var userBar         = $('.topbar'),
      calendarHeader  = $('.calendar-header'),
      calendarTable   = $('.calendar-wrap table'),
      calendarHeight  = calendarTable.outerHeight(),
      fixedHeight     = userBar.outerHeight() + calendarHeader.outerHeight();

  function adjustCalendarTable() {
    var winHeight = $(window).height();

    if ( winHeight > calendarHeight + fixedHeight ) {
      calendarTable.height( winHeight - fixedHeight );
    } else {
      calendarTable.height("auto");
    }

  };

  adjustCalendarTable();

  $(window).on('resize', function() {
    adjustCalendarTable();
  });
});