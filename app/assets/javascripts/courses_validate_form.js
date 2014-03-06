$(document).ready(function(){

  /*valdiación de formulario de comment*/
  $('#new_course').submit(function(){
    var course_title = $('#course_title'),
        course_silabus = $('#course_silabus'),
        course_init_date = $('#course_init_date'),
        course_finish_date = $('#course_finish_date'),
        course_survey_param_evaluation = $('#course_survey_param_evaluation'),
        course_delivery_param_evaluation = $('#course_delivery_param_evaluation');

    var surveys_percentage    = parseInt(course_survey_param_evaluation.val()),
        deliveries_percentage = parseInt(course_delivery_param_evaluation.val()),
        evaluation_total      = surveys_percentage + deliveries_percentage;
     
    if ( course_title.val() == '' ){
      course_title.attr("placeholder", "Debes colocar un título.");
      course_title.addClass('red-placeholder');
      return false;

    } else if ( course_silabus.val() == '' ) {
      course_silabus.attr("placeholder", "Debes colocar una descripción del curso.");
      course_silabus.addClass('red-placeholder');
      return false;

    } else if ( course_init_date.val() == '' ) {
      course_init_date.attr("placeholder", "Sin fecha de inicio.");
      course_init_date.addClass('red-placeholder');
      return false;

    } else if ( course_finish_date.val() == '' ) {
      course_finish_date.attr("placeholder", "Sin fecha final.");
      course_finish_date.addClass('red-placeholder');
      return false;

    } else if ( course_survey_param_evaluation.val() == '' ) {
      course_survey_param_evaluation.attr("placeholder", "No puede estar vacio");
      course_survey_param_evaluation.addClass('red-placeholder');
      return false;
    
    } else if ( course_delivery_param_evaluation.val() == '' ){
      course_delivery_param_evaluation.attr("placeholder", "No puede estar vacio");
      course_delivery_param_evaluation.addClass('red-placeholder');
      return false;

    } else if ( evaluation_total > 100 || evaluation_total <= 0 || evaluation_total < 100 ) {
      Notice('error', 'Los porcentajes de evaluación deben sumar 100.');
      return false;

    } else if ( typeof evaluation_total != "number" ) {
      Notice('error', 'Los porcentajes de evaluación deben de ser numeros.');
      return false;

    } else {
      course_title.attr("placeholder", "Título");
      course_title.addClass('normal-placeholder');

      course_silabus.attr("placeholder", "Descripción");
      course_silabus.addClass('normal-placeholder');

      course_init_date.attr("placeholder", "Fecha de inicio");
      course_init_date.addClass('normal-placeholder');

      course_finish_date.attr("placeholder", "Fecha de termino");
      course_finish_date.addClass('normal-placeholder');

      course_survey_param_evaluation.attr("placeholder", "");
      course_survey_param_evaluation.addClass('normal-placeholder');

      course_delivery_param_evaluation.attr("placeholder", "");
      course_delivery_param_evaluation.addClass('normal-placeholder');

      return true;
    }
  });
 });