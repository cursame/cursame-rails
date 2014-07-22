$(function(){

  var paginator = new Steady({
    conditions: {
      "max-bottom": 400
    },
    throttle: 500,
    handler: atBottom
  });

  function atBottom(a, done) {
    var button = $('.load-more a');

    if ( button.length ) {
      paginator.stop();
      $('#pageless-loader').show();

      $.getScript(button.attr('href'), function(data, status) {
        paginator.resume();
        $('#pageless-loader').hide();
      });
    }
    done();
  }
});