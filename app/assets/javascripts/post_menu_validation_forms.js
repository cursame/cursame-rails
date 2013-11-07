 $(document).ready(function(){
/*valdiación de formulario de comment*/
 $('.comment_form_top').submit(function(){
     var comment_validate = $('.comment_for_wall').val();
     if (comment_validate == ''){
         $('.comment_for_wall').attr("placeholder", "Este campo no debe quedar vacio para colocar el comentario.");
         $('.comment_for_wall').addClass('red-placeholder');
         $('.comment_for_wall').removeClass('normal-placeholder');
         
         return false;
         }else{
         $('.comment_for_wall').attr("placeholder", "¿Que estás pensando?");
         $('.comment_for_wall').addClass('normal-placeholder');
         return true;     
     }    

 });
 /*validación del forumulario de delivery*/
 $('.delivery-form').submit(function(){
     var title_delivery = $('#delivery_title').val();
     var delivery_end_date = $('.delivery_end_date').val();
     var delivery_publish_date = $('.delivery_publish_date').val();
     var delivery_description = $('#delivery_description').val();
     var delivery_porcent_of_evaluation = $('#delivery_porcent_of_evaluation').val();
     
         if (title_delivery == ''){
         $('#delivery_title').attr("placeholder", "El campo de tema no puede quedar vacio.");
         $('#delivery_title').addClass('red-placeholder');
         $('#delivery_title').removeClass('normal-placeholder');
         
         return false;
         }else if (delivery_end_date == ''){
         //console.log(delivery_publish_date); 
         $('.delivery_publish_date').attr("placeholder", "No puede estar vacio.");
         $('.delivery_publish_date').addClass('red-placeholder');
         $('.delivery_publish_date').removeClass('normal-placeholder');
         
         return false;  
         }else if (delivery_publish_date == ''){
         //console.log(delivery_end_date);
         $('.delivery_end_date').attr("placeholder", "No puede estar vacio.");
         $('.delivery_end_date').addClass('red-placeholder');
         $('.delivery_end_date').removeClass('normal-placeholder');
         
         return false;  
         }else if (delivery_description == ''){
         $('#delivery_description').attr("placeholder", "No puede estar vacia la descripción.");
         $('#delivery_description').addClass('red-placeholder'); 
         $('#delivery_description').removeClass('normal-placeholder');
         
         return false;      
         }else if (delivery_porcent_of_evaluation == ''){
         $('#delivery_porcent_of_evaluation').attr("placeholder", "La evaluación está vacia.");
         $('#delivery_porcent_of_evaluation').addClass('red-placeholder'); 
         $('#delivery_porcent_of_evaluation').removeClass('normal-placeholder');
         
           
         return false;      
             
             
         }else{
             
             
         $('#delivery_title').attr("placeholder", "Escribe el tema de la tarea");
         $('.delivery_end_date').attr("placeholder", "Fecha de entrega");
         $('.delivery_publish_date').attr("placeholder", "Dia de publicación");
         $('#delivery_description').attr("placeholder", "Descripcción");
         $('#delivery_porcent_of_evaluation').attr("placeholder", "En evalación final");
         
         $('#delivery_title').addClass('normal-placeholder');
         $('.delivery_end_date').addClass('normal-placeholder');
         $('.delivery_publish_date').addClass('normal-placeholder');
         $('#delivery_description').addClass('normal-placeholder');
         $('#delivery_porcent_of_evaluation').addClass('normal-placeholder');
         
         return true;     
     }     
              
     
 });
 /*validación del forumulario de discusiones*/
 $('#new_discussion').submit(function(){
     var discussion_title = $('#discussion_title').val();
     var discussion_description = $('#discussion_description').val();
     
      if (discussion_title == ''){
      $('#discussion_title').attr("placeholder", "El campo de título no puede quedar vacio.");
      $('#discussion_title').addClass('red-placeholder');
      $('#discussion_title').removeClass('normal-placeholder');
      
      return false;
      }else if (discussion_description == ''){
      $('#discussion_description').attr("placeholder", "No puede descripción estar vacio.");
      $('#discussion_description').addClass('red-placeholder');
      $('#discussion_description').removeClass('normal-placeholder');
      
      return false;  
        
      }else{
      $('#discussion_title').attr("placeholder", "Titulo de la discusión");
      $('#discussion_description').attr("placeholder", "Descripcción");
      $('#discussion_title').addClass('normal-placeholder');
      $('#discussion_description').addClass('normal-placeholder');
      return true;
      
      }
     
     
 });
 /*validación del forumulario de survey*/
 $('#new_survey').submit(function(){
     var survey_name = $('#survey_name').val();
     var survey_publish_date = $('.survey_publish_date').val();
     var survey_end_date = $('.survey_end_date').val();
     
       if (survey_name == ''){
       $('#survey_name').attr("placeholder", "El campo de título no puede quedar vacio.");
       $('#survey_name').addClass('red-placeholder');
       $('#survey_name').removeClass('normal-placeholder');
       
       return false;
       }else if (survey_publish_date == ''){
       $('.survey_publish_date').attr("placeholder", "Sin fecha de publicación.");
       $('.survey_publish_date').addClass('red-placeholder');
       $('.survey_publish_date').removeClass('normal-placeholder');
       
       return false;  
       }else if (survey_end_date == ''){
       $('.survey_end_date').attr("placeholder", "Sin fecha de entrega.");
       $('.survey_end_date').addClass('red-placeholder');
       $('.survey_end_date').removeClass('normal-placeholder');
       
       return false;  
      
       }else{
       $('#survey_name').attr("placeholder", "Título del cuestionario ");
       $('.survey_publish_date').attr("placeholder", "Fecha de publicación");
       $('.survey_end_date').attr("placeholder", "Fecha de entrega");
       
       $('#survey_name').addClass('normal-placeholder');
       $('.survey_publish_date').addClass('normal-placeholder');
       $('.survey_end_date').addClass('normal-placeholder');
       
       return true;

       }
     
     
 });
 
 });