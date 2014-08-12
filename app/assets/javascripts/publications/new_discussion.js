$(function() {

  $('.evaluable-fields-trigger-js').live('click', function(event) {
    var $this = $(this),
        form = $this.closest('form'),
        containerFields = form.find('div.evaluable-fields-js');

    if ( $this.hasClass('active') ) {
      $this.removeClass('active');
      containerFields.hide();  
    } else {
      $this.addClass('active');
      containerFields.show();
    };
  });

  $('form.discussion-form-js').validate({
    submitHandler: function(form) {
      var $form = $(form),
          evaluable = $form.find('input.evaluable-fields-trigger-js'),
          error = 0;

      if ( evaluable.is(':checked') ) {
        var is_public = $form.find('input[name=is_public]');

        if ( is_public.val() == 1 ) {
          error = 1;
        }
      }

      if ( ! error ) {
        $form.ajaxSubmit();
      } else {
        Notice('error', 'No puedes crear una discusión calificable sin un curso.');
        return false;
      };
    }
  });
});