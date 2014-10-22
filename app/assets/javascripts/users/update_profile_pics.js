Spinners.create('.spinner', {
  width: 2.5,
  height: 7,
  color: '#ffffff'
}).play();

function updateProfilePic (input, type) {
  var $input   = $(input),
      $form    = $input.closest('form'),
      $label   = $form.find('.profile-avatar-upload'),
      $loading = $form.find('.profile-avatar-loading'),
      $globalSidebar = $('div.global-sidebar'),
      $changeCoverButton = $('.update-cover-pic');

  $label.hide();
  $changeCoverButton.hide();
  $loading.fadeIn(100);

  $form.ajaxSubmit({
    resetForm: true,
    success: function(data) {

      if ( data.error == 1 ) {
        Notice( 'error', data.message )
      } else {
        $('.profile-avatar img.avatar').attr('src', data.avatar.profile);

        if ( type == 'user' ) {
          $globalSidebar.find('div.user img').attr('src', data.avatar.head);
        } else {
          $globalSidebar.find('.user-courses-js').find('a#' + data.course_id).find('img').attr('src', data.avatar.head);
          $globalSidebar.find('.courses-online-js').find('a#' + data.course_id).find('img').attr('src', data.avatar.head);
        }
      };

      $label.show();
      $changeCoverButton.show();
      $loading.fadeOut(100);
    }
  });
};

function updateCoverPic (input) {
  var $input          = $(input),
      $form           = $input.closest('form'),
      $label          = $form.find('.profile-cover-upload'),
      $profileAvatar  = $('div.profile-avatar'),
      $adminButtons   = $('div.admin-buttons'),
      $banner         = $('div.profile-banner'),
      $loading        = $('div.profile-cover-loading');

  $label.hide();
  $adminButtons.hide();
  $profileAvatar.hide();
  $loading.show();

  $form.ajaxSubmit({
    resetForm: true,
    success: function (data) {

      if ( data.error == 1 ) {
        Notice( 'error', data.message )
      } else {
        $banner.css('background-image', 'url(' + data.cover + ')');
      };

      $loading.hide();
      $label.show();
      $adminButtons.show();
      $profileAvatar.show();
    }
  })
}