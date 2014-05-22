$(function() {
  $('.switch-form-website-login').click(function(event) {
    var $this = $(this),
        idTarget = $this.data('form');

    $('.website-login-form-content').removeClass('active');
    $('#' + idTarget).addClass('active');
    event.preventDefault();
  });
});