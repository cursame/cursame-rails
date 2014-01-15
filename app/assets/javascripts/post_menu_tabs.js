$(document).ready(function(){
$('#comment-tab').click(function(){
    //console.log('click');
    $('#message-form-area-tab').show();
    $('#delivery-form-area-tab').hide();
    $('#survey-form-area-tab').hide();
    $('#discussion-form-area-tab').hide();
    
    $('#comment-tab').addClass('selected_tab');
    $('#delvery-tab').removeClass('selected_tab');
    $('#survey-tab').removeClass('selected_tab');
    $('#discusison-tab').removeClass('selected_tab');
    
});

$('#delvery-tab').click(function(){
    //console.log('click');

    $('#message-form-area-tab').hide();
    $('#delivery-form-area-tab').show().css({ display: "inline-block" });
    $('#survey-form-area-tab').hide();
    $('#discussion-form-area-tab').hide().css({ display: "none" });
    
    $('#comment-tab').removeClass('selected_tab');
    $('#delvery-tab').addClass('selected_tab');
    $('#survey-tab').removeClass('selected_tab');
    $('#discusison-tab').removeClass('selected_tab');
});

$('#discusison-tab').click(function(){
    //console.log('click');
    
    $('#message-form-area-tab').hide();
    $('#delivery-form-area-tab').hide().css({ display: "none" });
    $('#discussion-form-area-tab').show().css({ display: "inline-block" });
    $('#survey-form-area-tab').hide();
    
    $('#comment-tab').removeClass('selected_tab');
    $('#delvery-tab').removeClass('selected_tab');
    $('#survey-tab').removeClass('selected_tab');
    $('#discusison-tab').addClass('selected_tab');
    
});

$('#survey-tab').click(function(){
    //console.log('click');
    
    $('#message-form-area-tab').hide();
    $('#delivery-form-area-tab').hide().css({ display: "none" });
    $('#discussion-form-area-tab').hide().css({ display: "none" });
    $('#survey-form-area-tab').show();
    
    $('#comment-tab').removeClass('selected_tab');
    $('#delvery-tab').removeClass('selected_tab');
    $('#survey-tab').addClass('selected_tab');
    $('#discusison-tab').removeClass('selected_tab');
    
    
});
$('.cancel-post-form_tab').click(function(){
    //console.log('click');
    $('#message-form-area-tab').show();
    $('#delivery-form-area-tab').hide().css({ display: "none" });
    $('#survey-form-area-tab').hide();
    $('#discussion-form-area-tab').hide().css({ display: "none" });
    if ($('#new_discussion').length){
        $('#new_discussion')[0].reset();
        
    }
    if ($('.comment-form').length){
        $('.comment-form')[0].reset();
        
    }
    if ($('.delivery-form').length){
        $('.delivery-form')[0].reset();
        
    }
    if ($('#new_survey').length){
        $('#new_survey')[0].reset();
        
    }
    
    $('#comment-tab').addClass('selected_tab');
    $('#delvery-tab').removeClass('selected_tab');
    $('#survey-tab').removeClass('selected_tab');
    $('#discusison-tab').removeClass('selected_tab');
    $('.frcomment').show();
    $('.ftcomment').hide();
    
    
    /*se limpian todos los campos de los formularios*/
     /*comments*/
      $('#comment').attr("placeholder", "¿Que estás pensando?");
      $('#comment').addClass('normal-placeholder');
    
     /*tareas*/
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
      $('.wrapper-dropdown').css('border',' solid 1px #c9d1da');
      
      /*discussion*/
      $('#discussion_title').attr("placeholder", "Titulo de la discusión");
      $('#discussion_description').attr("placeholder", "Descripcción");
      $('#discussion_title').addClass('normal-placeholder');
      $('#discussion_description').addClass('normal-placeholder');
      
      /*survey*/
      
      $('#survey_name').attr("placeholder", "Título del cuestionario");
      $('.survey_publish_date').attr("placeholder", "Fecha de publicación");
      $('.survey_end_date').attr("placeholder", "Fecha de entrega");
      
      $('#survey_name').addClass('normal-placeholder');
      $('.survey_publish_date').addClass('normal-placeholder');
      $('.survey_end_date').addClass('normal-placeholder');
    
    
});

$('.frcomment').click(function(){
    $('.frcomment').hide();
    $('.ftcomment').show();
    
});

});