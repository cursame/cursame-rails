function totalEvaluation(form) {
  var fields = $(form).find('tr.course-evaluation-item-js'),
      total = 0;

  $.each(fields, function(index, field) {
    var input = $(field).find('input.course-evaluation-item-value-js');

    if ( input.is(":visible") ) {
      total += parseInt(input.val());
    };
  });

  return total;
}

$(function() {

  $('form.evaluation-form-js').on('click', '.delete-eva-criteria', function(e) {
    var form =  e.delegateTarget;

    $(this).parent().siblings('._destroy').val(1);
    $(this).closest('tr').slideUp(200, function() {
        var userSelectionTotal = totalEvaluation(form),
        cursameValue = 100 - userSelectionTotal;

      $(form).find('h5.cursame-evaluation-percentage span').text(cursameValue);
      e.preventDefault();

    });

    e.preventDefault();
  });

  $('form.evaluation-form-js').validate({
    submitHandler: function(form) {
      var userSelectionTotal = totalEvaluation(form);

      if ( userSelectionTotal <= 100 && userSelectionTotal >= 0  ) {
        form.submit();
      } else {
        Notice('error', 'Por favor verifica que el porcentaje total sea 100%.');
        return false;
      }
    }
  });

  $('form.evaluation-form-js').on('blur', 'input.course-evaluation-item-value-js', function(e) {
    var form =  e.delegateTarget,
        userSelectionTotal = totalEvaluation(form),
        cursameValue = 100 - userSelectionTotal;

    if ( userSelectionTotal <= 100 && userSelectionTotal > 0 ) {
      $(form).find('h5.cursame-evaluation-percentage span').text(cursameValue);
    } else {
      Notice('error', 'Por favor verifica que el porcentaje total sea 100%.');
    };

  });
});