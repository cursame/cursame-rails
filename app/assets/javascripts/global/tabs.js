$(function() {
  //Tab switcher
  $('.tabs-buttons .tab').live('click', function() {
    var $this       = $(this),
        targetTab   = $this.attr('data-id-target'),
        tabsParent  = $this.closest('.tabs'),
        tabsHolder  = tabsParent.find('.tabs-main');
        
    $this.siblings().removeClass('active');
    $this.addClass('active');

    tabsHolder.children('.tab-content').hide();
    var tabContent = tabsHolder.find("#" + targetTab);

    tabContent.show();

    // if ( tabsParent.hasClass('post-menu-tabs') ) {
    //   tabContent.find(':input:enabled:visible:first').focus();
    // };
  });
});