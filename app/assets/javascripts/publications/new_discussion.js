$(function() {

  $('#discussion_evaluable').on('change', function(event) {
    console.log('cambió');
    var $this = $(this),
        form = $this.closest('form'),
        containerFields = form.find('div.evaluable-fields-js');

    var checked = $this.prop('checked');

    var publish_date = form.find('#discussion_publish_date')[0],
        end_date = form.find('#discussion_end_date')[0];

    if ( !checked ) {
      $this.removeClass('active');
      containerFields.hide();
      publish_date.required = false;
      end_date.required = false;
    } else {
      $this.addClass('active');
      containerFields.show();
      publish_date.required = true;
      end_date.required = true;
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