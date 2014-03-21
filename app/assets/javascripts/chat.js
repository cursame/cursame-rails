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

    console.log(winWidth, spots);
    Chat.availableSpots = spots;
  },
  reOrder: function() {
    var panels = $('.chat-panel');

    panels.each(function(index, el) {
      index++;
      var item = $(el),
          minimized = item.hasClass('active');

      console.log(minimized);
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
    
    $.each( Chat.activePanelsChannels, function(index, val) {
      if ( val == channel ) {
        Chat.activePanelsChannels.splice(index, 1);
      };
    });

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
        //"/messages/course_channel_88?course=true"
        var idCourse = chanToOpen.channel.split('_')[2].split('?')[0];
        Chat.openChannel(idCourse, "course");
      } else {
        //"/messages/users_channel_18_29" and "/messages/users_channel_17_18"
        var string = chanToOpen.channel,
            a = string.split('_')[2],
            b = string.split('_')[3];

        if ( a == currentUserID ) {
          Chat.openChannel( b, "user");
        } else {
          Chat.openChannel( a, "user");
        };
      };

      Chat.pendingPanelsCount--;
      Chat.pendingPanelsChannels.splice(0, 1);
    };
  },
  openChannel: function(id, type) {
    var baseURL = "/home/open_channel/",
        finalURL;

    if ( type == "course" ) {
      finalURL = baseURL + id + "?course=true";
    } else if ( type == "user" ) {
      finalURL = baseURL + id;
    };
    
    $.get( finalURL, function(data) {
      Chat.moreReposition();
      Chat.updatePendingConversations();
    });
  },
  updatePendingConversations: function() {
    var pendingPanelsTab = $("#go-to-chats-url");
    if ( Chat.pendingPanelsCount > 0 ) {
      pendingPanelsTab.text( Chat.pendingPanelsCount )
    } else {
      pendingPanelsTab.remove();
    }
  },
  minimizePanel: function( obj ) {
    $(obj).closest('.chat-panel').toggleClass('active');
  }
};

Chat.assignSpots();