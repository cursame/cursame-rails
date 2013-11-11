$(document).ready(function(){
/*valdiación de formulario de comment*/
 $('#new_course').submit(function(){
     var course_title = $('#course_title').val();
     var course_silabus = $('#course_silabus').val();
     var course_init_date = $('#course_init_date').val();
     var course_finish_date = $('#course_finish_date').val();
     var course_survey_param_evaluation = $('#course_survey_param_evaluation').val();
     var course_delivery_param_evaluation = $('#course_delivery_param_evaluation').val();
     
     
     if (course_title == ''){
         $('#course_title').attr("placeholder", "Debes colocar un título.");
         $('#course_title').addClass('red-placeholder');
         $('#course_title').removeClass('normal-placeholder'); 
         return false;
         }else if (course_silabus == ''){
                  $('#course_silabus').attr("placeholder", "Debes colocar una descripción del curso.");
                  $('#course_silabus').addClass('red-placeholder');
                  $('#course_silabus').removeClass('normal-placeholder'); 
                  return false;    
         }else if (course_init_date == ''){
                  $('#course_init_date').attr("placeholder", "Sin fecha de inicio.");
                  $('#course_init_date').addClass('red-placeholder');
                  $('#course_init_date').removeClass('normal-placeholder'); 
                  return false;
         }else if (course_finish_date == ''){
                  $('#course_finish_date').attr("placeholder", "Sin fecha final.");
                  $('#course_finish_date').addClass('red-placeholder');
                  $('#course_finish_date').removeClass('normal-placeholder'); 
                  return false;
         }else if (course_survey_param_evaluation == ''){
                  $('#course_survey_param_evaluation').attr("placeholder", "Bacio.");
                  $('#course_survey_param_evaluation').addClass('red-placeholder');
                  $('#course_survey_param_evaluation').removeClass('normal-placeholder'); 
                  return false;
         }else if (course_delivery_param_evaluation == ''){
                  $('#course_delivery_param_evaluation').attr("placeholder", "Bacio.");
                  $('#course_delivery_param_evaluation').addClass('red-placeholder');
                  $('#course_delivery_param_evaluation').removeClass('normal-placeholder'); 
                  return false;
         }else{
         $('#course_title').attr("placeholder", "Título");
         $('#course_title').addClass('normal-placeholder');
         $('#course_silabus').attr("placeholder", "Descripción");
         $('#course_silabus').addClass('normal-placeholder');
         $('#course_init_date').attr("placeholder", "Fecha de inicio");
         $('#course_init_date').addClass('normal-placeholder');
         $('#course_finish_date').attr("placeholder", "Fecha de termino");
         $('#course_finish_date').addClass('normal-placeholder');
         $('#course_survey_param_evaluation').attr("placeholder", "");
         $('#course_survey_param_evaluation').addClass('normal-placeholder');
         $('#course_delivery_param_evaluation').attr("placeholder", "");
         $('#course_delivery_param_evaluation').addClass('normal-placeholder');
         return true;     
     }    

 });
 });