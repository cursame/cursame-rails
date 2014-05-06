$(function() {
  $('.jobs-links').on('click', 'a', function(event) {
    var $this = $(this),
        jobID = $this.data('job-target');
    
    $this.closest('.jobs-links').find('a').removeClass('active');
    $this.addClass('active')

    $('.job-view').removeClass('active');
    $('.job-view[data-job="'+ jobID +'"]').addClass('active')
    event.preventDefault();
  });

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