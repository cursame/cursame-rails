$(function() {

  /* Dropowns
----------------------------------*/
  $('div.dropdown-pull').live( 'click', function() {
    var $this    = $(this),
        holder   = $this.closest('.dropdown-wrap'),
        dropdown = holder.find('.dropdown-v');

    $('div.dropdown-v').parent().removeClass('active');

    if ( holder.hasClass('active') ) {
      holder.removeClass('active');
    } else {
      holder.addClass('active');
    }

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

  /* Tab switcher
  ----------------------------------*/
  $('.tabs-buttons .tab').live('click', function() {
    var $this       = $(this),
        targetTab   = $this.attr('data-id-target'),
        tabsHolder  = $this.closest('.tabs').find('.tabs-main');

    $this.siblings().removeClass('active');
    $this.addClass('active');

    tabsHolder.children('.tab-content').hide();
    tabsHolder.find("#" + targetTab).show();
  });


  /* Autoresize textareas
    ----------------------------------*/
  $('.autogrow').autosize();
  
});