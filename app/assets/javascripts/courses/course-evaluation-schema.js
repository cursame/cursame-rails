function totalEvaluation(form) {
  var fields = $(form).find('tr.course-evaluation-item-js'),
      total = 0;

  $.each(fields, function(index, field) {
    var input = $(field).find('input.course-evaluation-item-value-js');

    if ( input.is(":visible") ) {
      if ( ! input.val() == "" ) {
        total += parseFloat(input.val());
      }
    };
  });


  return total;
}

function validTotalPercentage(form) {
  var lists = $(form).find('div.course-evaluation-schema-list'),
      flag = true,
      percentageList = 0;
  $.each(lists, function(index, list) {
    percentageList = totalEvaluation(list)
    if (percentageList != 100 ) {
      flag = false;
    };
  })
  return flag;
}

function validateNameEval(form) {
  var fields = $(form).find('tr.course-evaluation-item-js');
  var flag = true;

  $.each(fields, function(index, field) {
    var input = $(field).find('input.course-evaluation-item-name-js');
    var inputDestroy = $(field).find('input._destroy');

    if ( input.val() === "cursame_deliveries" ) {
      if ( inputDestroy.val() == 'false' ) {
        Notice('error', 'Tu criterio no puede llamarse cursame_deliveries.');
        flag = false;
      }
    }

    if ( input.val() === "cursame_surveys" ) {
      if ( inputDestroy.val() == 'false' ) {
        Notice('error', 'Tu criterio no puede llamarse cursame_surveys.');
        flag = false;
      }
    }

    if ( input.val() === "cursame_discussions" ) {
      if ( inputDestroy.val() == 'false' ) {
        Notice('error', 'Tu criterio no puede llamarse cursame_discussions.');
        flag = false;
      }
    }

  });

    return flag;
}

$(function() {

  $('form.evaluation-form-js').validate({
    submitHandler: function(form) {
      var userSelectionTotal = totalEvaluation(form);
      var validateName = validateNameEval(form);
      var validPercentage = validTotalPercentage(form);

      if ( validPercentage ) {
        if ( validateName ) {
          form.submit();
        }
        // form.submit();
      } else {
        Notice('error', 'Por favor verifica que el porcentaje total sea 100%.');
          return false;
      }
    }
  });

  $('form.evaluation-form-js').on('click', '.delete-eva-criteria', function(e) {
    var form =  e.delegateTarget;

    $(this).parent().siblings('._destroy').val(1);
    $(this).closest('tr').slideUp(200, function() {
      var userSelectionTotal = totalEvaluation(form),
          cursameValue = 100 - userSelectionTotal;

      if ( userSelectionTotal <= 100 && userSelectionTotal > 0 ) {
        $(form).find('h5.cursame-evaluation-percentage span').text(cursameValue);
      };
    });

    e.preventDefault();
  });

  $('form.evaluation-form-js').on('blur', 'input.course-evaluation-item-value-js', function(e) {
    var form =  e.delegateTarget,
        validPercentage = validTotalPercentage(form),
        cursameValue = 100 - userSelectionTotal;

    if ( validPercentage ) {
      $(form).find('h5.cursame-evaluation-percentage span').text(cursameValue);
    } else {
      Notice('error', 'Por favor verifica que el porcentaje total sea 100%.');
    };

  });
});
