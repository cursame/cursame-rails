$('#form-mailer-list-js').validate({
  submitHandler: function(form) {
    var usersList = $('#network-users-list'),
        empty = false;

    if ( usersList.length && !usersList.find('.table-box-unit').length ) {
      empty = true;
    };

    if ( empty ) {
      Notice('error', 'No puedes enviar el correo sin elegir usuarios')
      return false;
    } else {
      form.submit();
    };
  }
});