$(function() {
  $('.cancel-post-form_tab').live('click', function(event) {
    event.preventDefault();
    newPublicationCleaner();
  });
});