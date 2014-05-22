$(function() {
  $('.features-links li').click(function() {
    var $this = $(this),
        feature = $this.data('fea'),
        target = $('.feature[data-fea-id="'+ feature +'"]');

    $this.siblings().removeClass('active');
    $this.addClass('active');
    $('.feature').removeClass('active');
    target.addClass('active');
  });
});