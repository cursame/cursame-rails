function readURL(input, id, width) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $('#' + id)
      .attr('src', e.target.result)
    };
    reader.readAsDataURL(input.files[0]);
  }
}

$('#create-course-form').validate({
  submitHandler: function(form) {
    var teachersList = $('#course-teachers-list'),
        empty = false;

    if ( teachersList.length && !teachersList.find('.table-box-unit').length ) {
      empty = true;
    };

    if ( empty ) {
      Notice('error', 'No puedes crear un curso sin profesores.')
      return false;
    } else {
      form.submit();
    };
  }
});