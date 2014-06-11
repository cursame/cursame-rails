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

  if ( $.browser.mobile ) {
    $('.calendar-wrap tbody td').click(function(event) {
      var self = $(this),
          eventsExists = self.find('.events-availables').length,
          calendar = $('.calendar-wrap');

      if ( eventsExists > 0 ) {
        var dayId = self.find('.identifiear-day').data('day-id'),
            wrap = $('.calendar-events-wrap'),
            holder = wrap.find('.calendar-events-main');

        wrap.show();
        calendar.hide();
        wrap.find('.calendar-events-day').text( dayId );
        holder.find('a').hide();
        holder.find('[data-day-id="'+ dayId +'"]').show();
      };
    });

    $('.back-to-calendar').click(function(event) {
      event.preventDefault();
      $('.calendar-wrap').show();
      $('.calendar-events-wrap').hide();
    });
  };
});