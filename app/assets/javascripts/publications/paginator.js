$(function(){
  var working = false;

  var paginator = new Steady({
    conditions: {
      "max-bottom": 100
    },
    throttle: 700,
    handler: atBottom
  });

  function atBottom(a, done) {
    if (working) {
      return;
    }

    var button = $('.load-more a');
    paginator.stop();

    if ( button.length ) {
      working = true;
      $('#pageless-loader').css('opacity', '1');

      $.getScript(button.attr('href'), function(data, status) {
        paginator.resume();
        working = false;
        $('#pageless-loader').css('opacity', '0');
      });
    }
    done();
  }
});