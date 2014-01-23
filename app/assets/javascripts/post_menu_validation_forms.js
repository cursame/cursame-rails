$(document).ready(function(){

  /* Valdiación de formulario de comment*/
  $('.comment_form_top').submit(function(){
     var comment_validate = $('.comment_for_wall').val();

     if ( comment_validate == '' ){
         $('.comment_for_wall').attr("placeholder", "Este campo no debe quedar vacio para colocar el comentario.");
         $('.comment_for_wall').addClass('red-placeholder');
         
         return false;

         } else {
           $('.comment_for_wall').attr("placeholder", "¿Que estás pensando?");
           $('.comment_for_wall').removeClass('red-placeholder');

         return true;     
     }    
  });

 /* Validación del forumulario de delivery*/
  $('.delivery-form').submit(function(){
    var title_delivery                  = $('#delivery_title'),
        delivery_publish_date           = $('.delivery_publish_date'),
        delivery_end_date               = $('.delivery_end_date'),
        delivery_description            = $('#delivery_description'),
        delivery_porcent_of_evaluation  = $('#delivery_porcent_of_evaluation');
     
        if ( title_delivery.val() == '' ){
          title_delivery.attr("placeholder", "El campo de tema no puede quedar vacio.");
          title_delivery.addClass('red-placeholder');
          return false;
        
        } else if ( delivery_publish_date.val() == '' ) {
          delivery_publish_date.attr("placeholder", "No puede estar vacio.");
          delivery_publish_date.addClass('red-placeholder');
          return false;  
        
        } else if ( delivery_end_date.val() == ''){
          delivery_end_date.attr("placeholder", "No puede estar vacio.");
          delivery_end_date.addClass('red-placeholder');
          return false;  
        
        } else if ( delivery_description.val() == '' ){
          delivery_description.attr("placeholder", "No puede estar vacia la descripción.");
          delivery_description.addClass('red-placeholder'); 
          return false;

        } else if ( delivery_porcent_of_evaluation.val() == '' ) {
          delivery_porcent_of_evaluation.attr("placeholder", "La evaluación está vacia.");
          delivery_porcent_of_evaluation.addClass('red-placeholder'); 
          return false;

        } else {   

          title_delivery.attr("placeholder", "Ejemplo Numero primos");
          title_delivery.removeClass('red-placeholder');

          delivery_publish_date.attr("placeholder", "Dia de publicación");
          delivery_publish_date.removeClass('red-placeholder');

          delivery_end_date.attr("placeholder", "Fecha de entrega");
          delivery_end_date.removeClass('red-placeholder');

          delivery_description.attr("placeholder", "Descripcción");
          delivery_description.removeClass('red-placeholder');

          delivery_porcent_of_evaluation.attr("placeholder", "En evalación final");
          delivery_porcent_of_evaluation.removeClass('red-placeholder');

          return true;
     }
  });

  /* Validación del forumulario de discusiones*/
  $('#new_discussion').submit(function(){
    var discussion_title = $('#discussion_title'),
        discussion_description = $('#discussion_description');
     
    if ( discussion_title.val() == '' ){
      discussion_title.attr("placeholder", "El campo de título no puede quedar vacio.");
      discussion_title.addClass('red-placeholder');
      return false;

    } else if ( discussion_description.val() == '' ) {
      discussion_description.attr("placeholder", "No puede descripción estar vacio.");
      discussion_description.addClass('red-placeholder');      
      return false;
    
    } else {
      discussion_title.attr("placeholder", "Ejemplo Numero primos");
      discussion_title.removeClass('red-placeholder');

      discussion_description.removeClass('red-placeholder');
      
      return true;
    }
  });

  /* Validación del forumulario de survey*/
  $('#new_survey').submit(function(){
    var survey_name         = $('#survey_name'),
        survey_publish_date = $('.survey_publish_date'),
        survey_end_date      = $('.survey_end_date');
     
    if ( survey_name.val() == '' ) {
      survey_name.attr("placeholder", "El campo de título no puede quedar vacio.");
      survey_name.addClass('red-placeholder');
      return false;

    } else if ( survey_publish_date.val() == '' ){
      survey_publish_date.attr("placeholder", "Sin fecha de publicación.");
      survey_publish_date.addClass('red-placeholder');
      return false;  
    } else if ( survey_end_date.val() == '' ) {
      survey_end_date.attr("placeholder", "Sin fecha de entrega.");
      survey_end_date.addClass('red-placeholder');       
      return false;  
      
    } else {
      survey_name.attr("placeholder", "Ejemplo Numero primos");
      survey_publish_date.attr("placeholder", "Fecha de publicación");
      survey_end_date.attr("placeholder", "Fecha de entrega");

      survey_name.removeClass('red-placeholder');
      survey_publish_date.removeClass('red-placeholder');
      survey_end_date.removeClass('red-placeholder');

      return true;
    }
  });

});