$(document).ready(function(){
$('#comment-tab').click(function(){
    //console.log('click');
    $('#message-form-area-tab').show();
    $('#delivery-form-area-tab').hide();
    $('#survey-form-area-tab').hide();
    $('#discussion-form-area-tab').hide();
});

$('#delvery-tab').click(function(){
    //console.log('click');
    
    $('#message-form-area-tab').hide();
    $('#delivery-form-area-tab').show();
    $('#survey-form-area-tab').hide();
    $('#discussion-form-area-tab').hide();
    
});

$('#discusison-tab').click(function(){
    //console.log('click');
    
    $('#message-form-area-tab').hide();
    $('#delivery-form-area-tab').hide();
    $('#discussion-form-area-tab').show();
    $('#survey-form-area-tab').hide();
    
});

$('#survey-tab').click(function(){
    //console.log('click');
    
    $('#message-form-area-tab').hide();
    $('#delivery-form-area-tab').hide();
    $('#discussion-form-area-tab').hide();
    $('#survey-form-area-tab').show();
});
$('.cancel-post-form_tab').click(function(){
    console.log('click');
    $('#message-form-area-tab').show();
    $('#delivery-form-area-tab').hide();
    $('#survey-form-area-tab').hide();
    $('#discussion-form-area-tab').hide();
    $('#new_discussion')[0].reset();
    $('.comment-form')[0].reset();
    $('.delivery-form')[0].reset();
    $('#new_survey')[0].reset();
});

});