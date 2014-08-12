$(function() {

  // Dropdowns
  $('div.dropdown-pull').live( 'click', function() {
    var $this    = $(this),
        holder   = $this.closest('.dropdown-wrap'),
        dropdown = holder.find('.dropdown-v');

    if ( holder.hasClass('active') ) {
      holder.removeClass('active');
    } else {
      $('div.dropdown-wrap').removeClass('active');
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
