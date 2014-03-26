Chat = {
  availableSpots: 3,
  activePanelsCount: 0,
  activePanelsChannels: [],
  pendingPanels: false,
  pendingPanelsCount: 0,
  pendingPanelsChannels: [],
  panelWidth: 250,
  panelSeparation: 10,
  assignSpots: function( resize ) {
    var winWidth = $(window).width() - 400,
        spots = Math.floor(winWidth / (Chat.panelWidth + Chat.panelSeparation / 2));

    Chat.availableSpots = spots;
  },
  reOrder: function() {
    var panels = $('.chat-panel');

    panels.each(function(index, el) {
      index++;
      var item = $(el);

      item.css('right', (Chat.panelWidth * index - Chat.panelWidth) + ( Chat.panelSeparation * index) );
    });
  },
  moreReposition: function() {
    var hiddenPanelsTab = $("#go-to-chats-url");
    hiddenPanelsTab.css('right', (Chat.panelWidth * Chat.activePanelsCount) + ( Chat.panelSeparation *  Chat.activePanelsCount) + Chat.panelSeparation );
  },
  removePanel: function( obj ) {
    var $this = $(obj)
        panel = $this.closest('.chat-panel'),
        channel = $this.data('channel'),
        currentUserID = $this.data('current-user-id');

    panel.remove();
    PrivatePub.unsubscribe(channel);

    Chat.removeActiveChannel(channel)
    Chat.activePanelsCount--;
    Chat.reOrder();
    Chat.showPendingPanels( currentUserID );
  },
  addPanel: function( data ) {
    var previousChannels = Chat.getConversationsFromCookies(),
        add = true;

    Chat.activePanelsCount++;
    Chat.reOrder();

    $.removeCookie(data.channel, { path: '/' });
    $.cookie( data.channel, JSON.stringify(data), { expires: 1, path: '/' });
  },
  showPendingPanels: function( currentUserID ) {
    if ( Chat.pendingPanelsCount > 0 ) {
      var chanToOpen = Chat.pendingPanelsChannels[0];

      if ( chanToOpen.type == "course" ) {
        var ID = Chat.parseChannelID( "course", chanToOpen.channel, currentUserID );
        Chat.openChannel( ID, "course");

      } else {
        var ID = Chat.parseChannelID( "user", chanToOpen.channel, currentUserID );
        Chat.openChannel( ID, "user", "", currentUserID);
      };

      Chat.pendingPanelsCount--;
      Chat.pendingPanelsChannels.splice(0, 1);
      Chat.updatePendingConversations( currentUserID );
    };
  },
  parseChannelID: function( type, url, currentUserID ) {
    if ( type == "course" ) {
      //"/messages/course_channel_88?course=true"
      return url.split('_')[2].split('?')[0];
    } else {
      //"/messages/users_channel_18_29" and "/messages/users_channel_17_18"
      var a = url.split('_')[2],
          b = url.split('_')[3];

      if ( a == currentUserID ) {
        return b;
      } else {
        return a;
      };
    };
  },
  openChannel: function(id, type, f, currentUserID) {
    var baseURL = "/home/open_channel/",
        finalURL;
    type == "course" ? finalURL = baseURL + id + "?course=true" : finalURL = baseURL + id;

    var def = $.getScript(finalURL);

    def.done(function() {
      Chat.moreReposition();
      Chat.updatePendingConversations( currentUserID );

      if ( typeof f === 'function' && f != undefined ) {
        f();
      };
    });
  },
  updatePendingConversations: function( currentUserID ) {
    var pendingPanelsTab = $("#go-to-chats-url"),
        listPendings = pendingPanelsTab.find('.pending-channels-list');

    if ( Chat.pendingPanelsCount > 0 ) {
      pendingPanelsTab.find('.counter').text( Chat.pendingPanelsCount )
      listPendings.html('');

      for (var i = 0; Chat.pendingPanelsChannels.length - 1 >= i; i++) {
        listPendings.append(' <li class="activable" data-channel="' +Chat.pendingPanelsChannels[i].channel+ '" data-channel-type="' +Chat.pendingPanelsChannels[i].type+ '" data-current-user-id="' +currentUserID+ '" onclick="Chat.switchPanel(this)">' +Chat.pendingPanelsChannels[i].name+ '</li> ')
      };

    } else {
      pendingPanelsTab.remove();
    }
  },
  minimizePanel: function( obj ) {
    var $this = $(obj),
        panel = $this.closest('.chat-panel'),
        channelOnPanel = panel.data('channel');

    for (var i = 0; Chat.activePanelsChannels.length - 1 >= i; i++) {
      if ( Chat.activePanelsChannels[i].channel == channelOnPanel ) {
        var position = i;
      };
    };

    var cookie = $.cookie(channelOnPanel);

    if ( cookie ) {
      var objCookie = JSON.parse(cookie);

      if ( panel.hasClass('active') ) {
        panel.removeClass('active');
        objCookie.state = "minimized";
        Chat.activePanelsChannels[position].state = "minimized";
      } else {
        panel.addClass('active');
        objCookie.state = "expanded";
        Chat.activePanelsChannels[position].state = "expanded";
      };

      $.cookie( objCookie.channel, JSON.stringify(objCookie), { path: '/' });
    };
  },
  switchPanel: function( obj ) {
    var $this = $(obj),
        channel = $this.data('channel'),
        channelType = $this.data('channel-type')
        currentUserID = $this.data('current-user-id'),
        chatPanels = $('.chat-panel'),

        panelToBeRemoved = $(chatPanels[ chatPanels.length - 1 ]),
        channelOnPanel = panelToBeRemoved.data('channel'),

        activeCookie = JSON.parse($.cookie(channelOnPanel)),
        pendingCookie = JSON.parse($.cookie(channel));

    activeCookie.state = "pending";
    pendingCookie.state = "expanded";

    $.cookie( activeCookie.channel, JSON.stringify(activeCookie), { path: '/' });
    $.cookie( pendingCookie.channel, JSON.stringify(pendingCookie), { path: '/' });

    Chat.activePanelsCount--;

    for (var i = 0; Chat.activePanelsChannels.length - 1 >= i; i++) {
      if ( Chat.activePanelsChannels[i].channel == channelOnPanel ) {
        var flyingChannel = Chat.activePanelsChannels[i];
        Chat.activePanelsChannels.splice(i, 1);
      };
    };

    for (var i = 0; Chat.pendingPanelsChannels.length - 1 >= i; i++) {
      if ( Chat.pendingPanelsChannels[i].channel == channel ) {
        Chat.pendingPanelsChannels.splice(i, 1);
      };
    };

    $this.closest('#go-to-chats-url').removeClass('active');
    panelToBeRemoved.remove();

    PrivatePub.unsubscribe(channel);
    PrivatePub.unsubscribe(channelOnPanel);

    var ID = Chat.parseChannelID( channelType, channel, currentUserID );
    flyingChannel.state = "pending";
    Chat.pendingPanelsChannels.push( flyingChannel );
    Chat.openChannel( ID, channelType, "", currentUserID);
  },
  channelExistActive: function( channel ) {
    if ( Chat.activePanelsChannels.length == 0) {
      return false;
    } else {
      var check = false;

      for (var i = 0; Chat.activePanelsChannels.length - 1 >= i; i++) {
        if ( Chat.activePanelsChannels[i].channel == channel ) {
          check = true;
        };
      };

      return check;
    };
  },
  channelExistPending: function( channel ) {
    if ( Chat.pendingPanelsChannels.length == 0) {
      return false;
    } else {
      var check = false;

      for (var i = 0; Chat.pendingPanelsChannels.length - 1 >= i; i++) {
        if ( Chat.pendingPanelsChannels[i].channel == channel ) {
          check = true;
        };
      };

      return check;
    };
  },
  recoverConversations: function( currentUserID ) {
    var previousChannels = Chat.getConversationsFromCookies();

    $.each( previousChannels, function(i, item) { 
      if ( item.state == 'expanded') {
        var ID = Chat.parseChannelID( item.type, item.channel, currentUserID);
        Chat.openChannel( ID, item.type, "", currentUserID);
      } else if ( item.state == 'minimized') {
        var ID = Chat.parseChannelID( item.type, item.channel, currentUserID);
        Chat.openChannel( ID, item.type, function() {
          $('.chat-panel[data-channel="' +item.channel+ '"] .chat-panel-header').trigger('click');
        }, currentUserID);
      };
    });

    $.each( previousChannels, function(i, item) { 
      if ( item.state == 'pending') {
        var ID = Chat.parseChannelID( item.type, item.channel, currentUserID);
        Chat.openChannel( ID, item.type, "", currentUserID);
      };
    });
  },
  getConversationsFromCookies: function() {
    var cookies = $.cookie(),
    preparedChannels = [];

    $.each( cookies, function(i, item) {
      try {
        preparedChannels.push( JSON.parse(item) );
      } catch(e) {
      };
    });

    return preparedChannels;
  },
  repositionPanelOnWidth: function() {
    // console.log(Chat.activePanelsCount, Chat.availableSpots);

    if (Chat.activePanelsCount > Chat.availableSpots) {
      var panels = $('.chat-panel'),
          panelToBeRemoved = panels[panels.length-1],
          channel = $(panelToBeRemoved).data('channel');

      $(panelToBeRemoved).remove();
      PrivatePub.unsubscribe(channel);
      Chat.removeActiveChannel(channel);
      Chat.activePanelsCount--;
      Chat.reOrder();
      Chat.moreReposition();
    };
  },
  removeActiveChannel: function( channel ) {
    for (var i = 0; Chat.activePanelsChannels.length - 1 >= i; i++) {
      if ( Chat.activePanelsChannels[i].channel == channel ) {
        Chat.activePanelsChannels.splice(i, 1);
      };  
    };

    $.removeCookie(channel, { path: '/' });
  }
};

Chat.assignSpots();

$(function() {
  $('.chat-panels').on('click', '#go-to-chats-url .counter', function(event) {
    event.preventDefault();
    $(this).parent().toggleClass('active');
  });
});