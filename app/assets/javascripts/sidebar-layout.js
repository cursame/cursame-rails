Sidebar = {
  init: function() {
    this.sidebar = $('.global-sidebar');
    this.collapsed = false;
    this.sidebarVisible = false;
    this.minWidth = 1125;
    this.bindEvents();
    this.fitCheck();
  },
  bindEvents: function() {
    var self = this;
    $(window).on('resize', function(event) {
      self.fitCheck();
    });
    $('.menu-sidebar').on('click', function() {
      if ( self.sidebarVisible ) {
        self.hideSideBarAnimation();
      } else {
        self.showSideBarAnimation();
      };
    });
  },
  fitCheck: function() {
    var winHeight = $(window).height(),
        winWidth = $(window).width();

    Sidebar.resizeInHeight( winHeight );
    if ( winWidth <= this.minWidth ) {
      if ( !this.collapsed ) {
        this.hideSidebar();
      };
    } else {
      this.restoreSidebar();
    }
  },
  resizeInHeight: function( winHeight ) {
    var items = $('.s-unit'),
        itemsToFill = $('.s-to-f'),
        itemsHeight = 0,
        availableHeight = 0;

    $.each(items, function(index, item) {
       itemsHeight += $(item).outerHeight();
    });

    availableHeight = winHeight - itemsHeight;

    $.each(itemsToFill, function(index, item) {
      $(item).height( availableHeight / itemsToFill.length );
    });
  },
  hideSidebar: function() {
    this.collapsed = true;
    this.sidebarVisible = false;
    this.sidebar.css('left', '-230px');
    $('body').addClass('collapsed-layout no-sidebar');
    $('.notice-spacer').css('paddingLeft', '0');
    $('.menu-sidebar').show();
    $('.topbar-spacer').css('paddingLeft', '0');
  },
  restoreSidebar: function() {
    this.collapsed = false;
    this.sidebarVisible = true;
    this.sidebar.css('left', '0');
    $('body').removeClass('collapsed-layout no-sidebar').css('paddingLeft', '0');
    $('.notice-spacer').css('paddingLeft', '230px');
    $('.menu-sidebar').hide().removeClass('active');
    $('.topbar-spacer').css('paddingLeft', '230px');
  },
  showSideBarAnimation: function() {
    this.sidebarVisible = true;
    $('body, .topbar .topbar-spacer').animate({ paddingLeft: 230 }, 100);
    $('body').css('overflow', 'hidden !important');
    this.sidebar.animate({ left: 0 }, 100);
  },
  hideSideBarAnimation: function() {
    this.sidebarVisible = false;
    $('body, .topbar .topbar-spacer').animate({ paddingLeft: 0 }, 100);
    $('body').css('overflow', 'auto');
    this.sidebar.animate({ left: -230 }, 100);
  }
};

$(function() {
  Sidebar.init();
});
