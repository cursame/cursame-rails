Sidebar = {
  init: function() {
    this.sidebar = $('.global-sidebar');
    this.collapsed = false;
    this.sidebarVisible = false;
    this.minWidth = 930;
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
    if ( winWidth < this.minWidth ) {
      if ( !this.collapsed ) {
        this.hideSidebar();
      }
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
    this.sidebar.css('left', '-200px');
    $('body').addClass('collapsed-layout no-sidebar');
    $('.notice-spacer').css('paddingLeft', '0');
    $('.menu-sidebar').show();
  },
  restoreSidebar: function() {
    this.collapsed = false;
    this.sidebarVisible = true;
    this.sidebar.css('left', '0');
    $('body').removeClass('collapsed-layout no-sidebar').css({paddingLeft: 0, overflow: 'auto'});
    $('.notice-spacer').css('paddingLeft', '200px');
    $('.menu-sidebar').hide().removeClass('active');
    $('.topbar').css({ left: 0 });
  },
  showSideBarAnimation: function() {
    this.sidebarVisible = true;
    $('.topbar').animate({ left: 200 }, 100);
    $('body').animate({ paddingLeft: 200 }, 100);
    $('body').css('overflow', 'hidden');
    $('.content-sidebar-stick').hide();
    this.sidebar.animate({ left: 0 }, 100, function() { $('.content-sidebar-stick').show(); });
  },
  hideSideBarAnimation: function() {
    this.sidebarVisible = false;
    $('.topbar').animate({ left: 0 }, 100);
    $('body').animate({ paddingLeft: 0 }, 100);
    $('body').css('overflow', 'auto');
    $('.content-sidebar-stick').hide();
    this.sidebar.animate({ left: -200 }, 100, function() { $('.content-sidebar-stick').show(); });
  }
};

$(function() {
  Sidebar.init();
});
