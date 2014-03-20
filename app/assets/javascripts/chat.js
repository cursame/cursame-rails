Chat = {
  panelCount: 0,
  hiddenCount: 0,
  pendingChannels: {},
  panelWidth: 280,
  panelSeparation: 20,
  reOrder: function() {
    var panels = $('.chat-panel');

    panels.each(function(index, el) {
      index++;
      if ( index == 1) {
        $(el).css("right", "20px");
      } else {
        $(el).css("right", (Chat.panelWidth * index - Chat.panelWidth) + ( Chat.panelSeparation * index) );
      };   
    });
  }
};