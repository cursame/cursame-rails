$(function() {

  /* Dropowns
----------------------------------*/
  $('div.dropdown-pull').live( 'click', function() {
    var $this    = $(this),
        holder   = $this.closest('.dropdown-wrap'),
        dropdown = holder.find('.dropdown-v');

    $('div.dropdown-v').hide();
    dropdown.show();
    console.log("asdasd");

  });


  $('html').click(function(event) {
    $('.dropdown-v').hide();
    $('.dropdown-wrap').removeClass('active');
  });

  $('.dropdown-v').click(function(e) {
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
