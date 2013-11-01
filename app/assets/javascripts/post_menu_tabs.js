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
    $('#delivery-form-area-tab').show();
    $('#survey-form-area-tab').hide();
    $('#discussion-form-area-tab').hide();
    
    $('#comment-tab').removeClass('selected_tab');
    $('#delvery-tab').addClass('selected_tab');
    $('#survey-tab').removeClass('selected_tab');
    $('#discusison-tab').removeClass('selected_tab');
});

$('#discusison-tab').click(function(){
    //console.log('click');
    
    $('#message-form-area-tab').hide();
    $('#delivery-form-area-tab').hide();
    $('#discussion-form-area-tab').show();
    $('#survey-form-area-tab').hide();
    
    $('#comment-tab').removeClass('selected_tab');
    $('#delvery-tab').removeClass('selected_tab');
    $('#survey-tab').removeClass('selected_tab');
    $('#discusison-tab').addClass('selected_tab');
    
});

$('#survey-tab').click(function(){
    //console.log('click');
    
    $('#message-form-area-tab').hide();
    $('#delivery-form-area-tab').hide();
    $('#discussion-form-area-tab').hide();
    $('#survey-form-area-tab').show();
    
    $('#comment-tab').removeClass('selected_tab');
    $('#delvery-tab').removeClass('selected_tab');
    $('#survey-tab').addClass('selected_tab');
    $('#discusison-tab').removeClass('selected_tab');
    
    
});
$('.cancel-post-form_tab').click(function(){
    console.log('click');
    $('#message-form-area-tab').show();
    $('#delivery-form-area-tab').hide();
    $('#survey-form-area-tab').hide();
    $('#discussion-form-area-tab').hide();
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
});

$('.frcomment').click(function(){
    $('.frcomment').hide();
    $('.ftcomment').show();
    
});

});