Chat = {
  availableSpots: 3,
  activePanelsCount: 0,
  activePanelsChannels: [],
  pendingPanels: false,
  pendingPanelsCount: 0,
  pendingPanelsChannels: [],
  panelWidth: 280,
  panelSeparation: 10,
  assignSpots: function() {
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
    
    for (var i = 0; Chat.activePanelsChannels.length - 1 >= i; i++) {
      if ( Chat.activePanelsChannels[i].channel == channel ) {
        Chat.activePanelsChannels.splice(i, 1);
      };  
    };

    PrivatePub.unsubscribe(channel);
    Chat.activePanelsCount--;
    Chat.reOrder();
    Chat.showPendingPanels( currentUserID );
  },
  addPanel: function() {
    Chat.activePanelsCount++;
    Chat.reOrder();
  },
  showPendingPanels: function( currentUserID ) {
    if ( Chat.pendingPanelsCount > 0 ) {
      var chanToOpen = Chat.pendingPanelsChannels[0];

      if ( chanToOpen.type == "course" ) {
        var ID = Chat.parseChannelID( "course", chanToOpen.channel, currentUserID );
        Chat.openChannel( ID, "course");

      } else {
        var ID = Chat.parseChannelID( "user", chanToOpen.channel, currentUserID );
        Chat.openChannel( ID, "user");
      };

      Chat.pendingPanelsCount--;
      Chat.pendingPanelsChannels.splice(0, 1);
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
  openChannel: function(id, type, f) {
    var baseURL = "/home/open_channel/",
        finalURL;
    type == "course" ? finalURL = baseURL + id + "?course=true" : finalURL = baseURL + id;

    var def = $.getScript(finalURL);

    def.done(function() {
      Chat.moreReposition();
      Chat.updatePendingConversations();

      if ( typeof f === 'function' && f != undefined ) {
        f();
      };
    });
  },
  updatePendingConversations: function() {
    var pendingPanelsTab = $("#go-to-chats-url");
    if ( Chat.pendingPanelsCount > 0 ) {
      pendingPanelsTab.find('.counter').text( Chat.pendingPanelsCount )
    } else {
      pendingPanelsTab.remove();
    }
  },
  minimizePanel: function( obj ) {
    $(obj).closest('.chat-panel').toggleClass('active');
  },
  switchPanel: function( obj ) {
    var $this = $(obj),
        channel = $this.data('channel'),
        channelType = $this.data('channel-type')
        currentUserID = $this.data('current-user-id'),
        chatPanels = $('.chat-panel'),

        panelToBeRemoved = $(chatPanels[ chatPanels.length - 1 ]),
        channelOnPanel = panelToBeRemoved.data('channel');

    Chat.activePanelsCount--;

    for (var i = 0; Chat.activePanelsChannels.length - 1 >= i; i++) {
      if ( Chat.activePanelsChannels[i].channel == channelOnPanel ) {
        var flyingChannel = {};
        flyingChannel.type = Chat.activePanelsChannels[i].type;
        flyingChannel.channel = Chat.activePanelsChannels[i].channel;
        flyingChannel.name = Chat.activePanelsChannels[i].name;
        Chat.activePanelsChannels.splice(i, 1);
        console.log("Holaa", flyingChannel);
      };
    };

    for (var i = 0; Chat.pendingPanelsChannels.length - 1 >= i; i++) {
      if ( Chat.pendingPanelsChannels[i].channel == channel ) {
        Chat.pendingPanelsChannels.splice(i, 1);
      };
    };

    $this.closest('#go-to-chats-url').removeClass('active');
    panelToBeRemoved.remove();

    var ID = Chat.parseChannelID( channelType, channel, currentUserID );

    Chat.openChannel( ID, channelType, function() {
      Chat.pendingPanelsChannels.push( flyingChannel );
      $this.replaceWith('<li class="activable" data-channel="' +flyingChannel.channel+ '" data-channel-type="' +flyingChannel.type+ '" data-current-user-id="' +currentUserID+ '" onclick="Chat.switchPanel(this)">' +flyingChannel.name+ '</li>');
    });
    
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
  }
};

Chat.assignSpots();

// $(function() {
//   $('.chat-panels').on('click', '#go-to-chats-url .counter', function(event) {
//     event.preventDefault();
//     $(this).parent().toggleClass('active');
//   });
// });