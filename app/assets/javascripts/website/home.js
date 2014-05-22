$(function() {
  $('.testimonials-nav').on('click', 'a', function(event) {
    var $this = $(this),
        idTarget = $this.data('id-target');

    console.log($this, idTarget);
    $this.siblings().removeClass('active');
    $this.addClass('active');
    $('.testimonial').removeClass('active');
    $('.testimonial[data-t-id="'+ idTarget +'"]').addClass('active');
    event.preventDefault();
  });
});