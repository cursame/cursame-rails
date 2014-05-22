$(function() {

  var userBar         = $('.topbar'),
      depotHeader     = $('div.activities-depot-header'),
      depot           = $('div.activities-depot-wrap'),
      availableSp     = userBar.outerHeight() + depotHeader.outerHeight();

  function adjustActivitiesDepot() {
    var winHeight = $(window).height();
    depot.height( winHeight - availableSp - 42 );
  };
  
  adjustActivitiesDepot();

  $(window).on('resize', function() {
    adjustActivitiesDepot();
  });
});