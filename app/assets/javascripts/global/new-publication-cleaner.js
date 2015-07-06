function newPublicationCleaner() {
  var newPublicationBox = $('.new-publication'),
      commentForm = newPublicationBox.find('form.comment-form '),
      deliveryForm = newPublicationBox.find('form.delivery-form'),
      discussionForm = newPublicationBox.find('form.new-discussion-form'),
      surveyForm = newPublicationBox.find('form.survey-form');

  newCommentFormCleaner(commentForm);
  newDeliveryFormCleaner(deliveryForm)
  newDiscussionFormCleaner(discussionForm)
  newSurveyFormCleaner(surveyForm)

  newPublicationBox.find('div.tabs-buttons .tab[data-id-target="comment-tab-content"]').trigger('click');
}

function newCommentFormCleaner(form) {
  var commentInput = form.find('#comment');
  commentInput.val('');
  commentInput.expanding('destroy');
  commentInput.expanding();

  var courseSelector = form.find('.target-dropdown');
  cleanCoursesSelectorDropdown(courseSelector);

  courseSelector.find('.return-dd').trigger('click');
  courseSelector.find('.world-dd').trigger('click');
};

function newDeliveryFormCleaner(form) {
  form.find('#delivery_title').val('');
  form.find('.delivery_end_date').val('');
  form.find('.delivery_publish_date').val('');
  form.find('#delivery_description').val('');
  form.find('#delivery_porcent_of_evaluation').val('');
  form.find('.fields-group').html('');
  form.find('.support-material').html('');
  cleanCoursesSelectorDropdown(form.find('.target-dropdown'));
};

function newDiscussionFormCleaner(form) {
  form.find('#discussion_title').val('');
  form.find('#discussion_description').val('');
  form.find('#discussion_evaluable').prop('checked', false);
  form.find('#discussion_evaluable').change();
  form.find('.datetime-picker').val('');
  form.find('.fields-group').html('');
  form.find('.support-material').html('');

  var courseSelector = form.find('.target-dropdown');
  cleanCoursesSelectorDropdown(courseSelector);
  courseSelector.find('.return-dd').trigger('click');
  courseSelector.find('.world-dd').trigger('click');
};

function newSurveyFormCleaner(form) {
  form.find('#survey_name').val('');
  form.find('.survey_publish_date').val('');
  form.find('.survey_end_date').val('');
  form.find('.fields-group').html('');
  form.find('.support-material').html('');
  cleanCoursesSelectorDropdown(form.find('.target-dropdown'));

  var questionsBox = $('.new-survey-questions #box-question-'),
      questionClone = questionsBox.find('.question-field:first-child').clone(true);

  questionsBox.html('').append(questionClone);
  questionsBox.find('.question-field .question-input-field').val('');

  var answersBox = questionsBox.find('.question-field #box-request-'),
      answerClone = answersBox.find('.request-field:first-child');

  answersBox.html('').append(answerClone);
  answersBox.find('.request-field .answer-field-input').val('');
  answersBox.find('.request-field .is-correct-chk').prop('checked', false);

};

function cleanCoursesSelectorDropdown(dropdown) {
  dropdown.find('.target-courses-selector .course-selector-js').each(function(index, checkbox) {
    $(checkbox).prop('checked', false).parent('label').removeClass('active');
  });

  dropdown.find('.evaluation-period-selector-js').each(function(index, checkbox) {
    $(checkbox).attr('checked', false).parent('label').removeClass('active');
  });
};

$(function() {
  $('.cancel-post-form_tab').click(function(event) {
    event.preventDefault();
    newPublicationCleaner();
  });
});
