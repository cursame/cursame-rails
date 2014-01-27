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


  $('body').click(function() {
    $('div.dropdown-wrap').removeClass('active');
  });

  $('div.dropdown-v').click(function(e) {
    e.stopPropagation();
  });

  /* Autoresize textareas
  ----------------------------------*/
  $('.autogrow').autosize();

  /* Tab switcher
  ----------------------------------*/
  $('.tabs-buttons .tab').click(function() {
    var $this       = $(this),
        targetTab   = $this.attr('data-id-target'),
        tabsHolder  = $this.closest('.tabs').children('.tabs-main');

    $this.siblings().removeClass('active');
    $this.addClass('active');

    tabsHolder.children('.tab-content').hide();
    tabsHolder.find("#" + targetTab).show();
  });

});
