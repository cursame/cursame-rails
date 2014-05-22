$(function() {
  $('.cancel-post-form_tab').click(function(e){
    e.preventDefault();

    var newPublicationBox = $('.new-publication');
    newPublicationBox.find('div.tab-content').hide()
    newPublicationBox.find('div#comment-tab-content').show();
    newPublicationBox.find('div.tabs-buttons .tab').removeClass('active');
    newPublicationBox.find('div.tabs-buttons .tab[data-id-target="comment-tab-content"]').addClass('active');
    
    // Comments
    $('#comment').val('');

    // Delivery
    $('#delivery_title').val('');
    $('.delivery_end_date').val('');
    $('.delivery_publish_date').val('');
    $('#delivery_description').val('');
    $('#delivery_porcent_of_evaluation').val('');

    // Discussion
    $('#discussion_title').val('');
    $('#discussion_description').val('');

    // Survey
    $('#survey_name').val('');
    $('.survey_publish_date').val('');
    $('.survey_end_date').val('');
  });
});