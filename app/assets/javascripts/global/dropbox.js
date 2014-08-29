$(function() {

  $('.add-dropbox-content-js').live('click', function (event) {
    var button = this;

    Dropbox.choose({
      linkType: "preview",
      multiselect: true,
      success: function(files) {
        var form = $(button).closest('form'),
            type = form.data('post-type'),
            supportContainer = form.find('div.support-material');

        $.each(files, function(index, file) {
          var id = file.bytes + Math.floor(Math.random()*113);
          file.type = type.toLowerCase();
          file.id = id;
          console.log(file);
          supportContainer.append( HandlebarsTemplates['assets/dropbox-asset']( file ) )
        });
      }
    });
    
    event.preventDefault();
  });

  $('.dropbox-delete-js').live('click', function(event) {
    $(this).closest('div.support-material-item').remove();
    event.preventDefault();
  });

});