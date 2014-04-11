ContentSidebar = {
  init: function() {
    this.sidebar = $('.content-sidebar-stick');
    this.offset = this.sidebar.offset();
    this.offsetTop = this.offset.top,
    this.bindEvents();
  },
  bindEvents: function() {
    var self = this;
    $(window).bind('scroll resize', function(event) { self.checkFit() });
  },
  getSidebarHeight: function() {
    var sections = $('div.c-side-item');
        height = 0;

    $.each(sections, function(index, item) {
      height += $(item).outerHeight() + 20;
    });

    return height;
  },
  checkFit: function() {
    var winHeight = $(window).height(),
        sidebarHeight = this.getSidebarHeight();

    winHeight < sidebarHeight ? this.positionAtBottom() : this.positionAtTop();
  },
  positionAtBottom: function() {
    var winScrollTop = $(window).scrollTop(),
        winHeight = $(window).height(),
        limit = (this.getSidebarHeight() + this.offsetTop ) - winHeight;

    if ( winScrollTop >= limit ) {
      this.sidebar.css({
        position: 'fixed',
        top: 'auto',
        bottom: '20px'
      });
    } else {
      this.sidebar.css({
        position: 'relative',
        bottom: '0'
      });
    };
  },
  positionAtTop: function() {
    var winScrollTop = $(window).scrollTop(),
        barHeight = $('#user_nav').outerHeight();

    if ( winScrollTop + 15 >= this.offsetTop - barHeight) {
      this.sidebar.css({
        position: 'fixed',
        top: 15 + barHeight,
        bottom: 'auto'
      });
    } else {
      this.sidebar.css({
        position: 'relative',
        top: 'auto',
        bottom: 'auto'
      });
    }
  }
};

$(function() {
  if ( $('.content-sidebar-stick').length ) {
    ContentSidebar.init();
  };
});