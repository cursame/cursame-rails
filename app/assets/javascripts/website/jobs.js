$(function() {
  $('.jobs-links').on('click', 'a', function(event) {
    var $this = $(this),
        jobID = $this.data('job-target');
    
    $this.closest('.jobs-links').find('a').removeClass('active');
    $this.addClass('active');

    $('.job-view').removeClass('active');
    $('.job-view[data-job="'+ jobID +'"]').addClass('active');
    event.preventDefault();
  });
});