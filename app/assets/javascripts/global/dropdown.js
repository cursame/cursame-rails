$(function() {

  // Dropdowns
  $('div.dropdown-pull').live( 'click', function() {
    var $this    = $(this),
        holder   = $this.closest('.dropdown-wrap'),
        dropdown = holder.find('.dropdown-v');

    var active = holder.hasClass('active');

    $('div.dropdown-wrap').removeClass('active');

    if ( !active ) {
      holder.addClass('active');
    };
  });

  $('html').click(function(e) {
    var holder = $(e.target).closest( "div.dropdown-wrap" );

    // si no estamos sobre un dropdown
    if ( !holder.length ) {
      $('div.dropdown-wrap').removeClass('active');
    } else {
      holder.find('.activity-counter').html(0);
      holder.find('.activity-counter').hide();
    }
  });
});
