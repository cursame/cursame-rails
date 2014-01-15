$(function() {

  /* Dropddowns
----------------------------------*/
  $('.dropdown-pull').click( function() {
    var that      = $(this),
        holder    = that.parent(),
        dropdown  = holder.children('.dropdown-v');
    $('.dropdown-v').hide();
    dropdown.show();
    return false;
  });


  $('html').click(function(event) {
    $('.dropdown-v').hide();
  });

  $('.autogrow').autosize();

});
