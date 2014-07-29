$(function() {

  $( "#course_init_date, #course_finish_date" ).datepicker({
    inline: true,
    minDate: 0,
    showOtherMonths: true,
    dateFormat: 'dd/mm/yy',
    monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio','Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
    dayNamesMin: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab']
  }).on('change', function() {
    $(this).valid();
  });

  $('.toggle-activable').click(function() {
    var $this = $(this),
        formGroup = $this.closest('.form-group'),
        fields = formGroup.find('.dependent'),
        checked = $this.is(':checked');

    fields.each(function(index, el) {
      if ( checked ) {
        $(el).attr('required', 'required');
      } else {
        $(el).removeAttr('required');
        $(el).val('').valid();
      };
    });
  });
  
});