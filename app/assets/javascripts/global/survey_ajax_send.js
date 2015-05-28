function sendSurveyByAjax(id_X){
  $("#"+id_X).submit(function() {
    var $form = $(this),
        $loadingMsg = $('.loading'),
        url = $form.attr('action'),
        formData = new FormData( $form[0] );
      $loadingMsg.show();
    if ($("#"+id_X).valid()) {
      $("#loader_img_survey").show();
      submitImage(url, formData, function(data, err) {
        if (err)
            $("#loader_img_survey").hide();
        $("#loader_img_survey").hide();
        $loadingMsg.hide();
      });
    }
    return false;
  });
}

function submitImage(url, formData, callback) {
  $.ajax({
    url: url,
    data: formData,
    processData: false,
    contentType: false,
    type: 'POST',
    success: function(data) {
        callback(data, null);
        $('.img_viewver_question').attr('src', '');
        $('.select_viwver_question').hide();
    },
    error: function(err) {
        callback(null, err);
    }
  });
};
