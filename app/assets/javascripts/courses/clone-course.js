$(function () {
  $("#course_init_date").datepicker({
    inline: true,
    minDate: 0,
    showOtherMonths: true,
    dateFormat: 'dd/mm/yy',
    monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
    dayNamesMin: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab']
  }).on('change', function () {
    $(this).valid();
  });

  $('#clone-course-form').formwizard({
    historyEnabled: true,
    validationEnabled: true,
    validationOptions: {
      rules: {
        "course[survey_param_evaluation]": {
          required: true,
          number: true,
          max: 100,
          min: 0,
          equalTo: 100
        },
        "course[delivery_param_evaluation]": {
          required: true,
          number: true,
          max: 100,
          min: 0,
          equalTo: 100
        }
      }
    },
    focusFirstInput : true,
    disableUIStyles : true  
  });

  jQuery.validator.addMethod("equalTo", function(value, element, params){
    var surveys_percentage  = parseInt($('#course_survey_param_evaluation').val()),
        deliveries_percentage = parseInt($('#course_delivery_param_evaluation').val()),
        evaluation_total  = surveys_percentage + deliveries_percentage;

    if ( evaluation_total > 100 || evaluation_total <= 0 || evaluation_total < 100 ) {
      return false;
    } else {
      $('#course_survey_param_evaluation, #course_delivery_param_evaluation').removeClass('error').siblings('label.error').remove();
      return true;
    };
  }, 'Los porcentajes de evaluación deben sumar 100.');

  $('.toggle-activable').click(function () {
    var $this = $(this), formGroup = $this.closest('.form-group'), fields = formGroup.find('.dependent'), checked = $this.is(':checked');
    fields.each(function (el) {
      if (checked) {
        $(el).attr('required', 'required');
      } else {
        $(el).removeAttr('required');
        $(el).val('').valid();
      }
    });
  });
});