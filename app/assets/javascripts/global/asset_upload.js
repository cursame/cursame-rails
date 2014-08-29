$(function() {
  var fileTypes = /(\.|\/)(jpg|jpeg|gif|ico|png|pdf|exe|ppt|txt|pptx|dmg|dwg|dwf|rar|zip|tar|iso|swf|flv|doc|docx|ade|adp|odt|rtf|sxw|sao|csv|xls)$/i;

  $('.upload-input').live('click', function(event) {
    $('.upload-input').fileupload({
      autoUpload: true,
      add: function(e, data) {
        var files = data.files,
            currentFile = data.files[0],
            size = (currentFile.size/1000000).toFixed(2);

        if ( fileTypes.test(currentFile.type) || fileTypes.test(currentFile.name)  ) {
          if ( size > 25 ) {
            Notice('error', 'Estas intentando subir un archivo pesado, el tamaño maximo son 25MB.');
            return false;
          } else {
            data.submit();
          };

        } else {
          Notice('error', 'Uno o el archivo que intentas subir no esta soportado.');
          return false;
        };
      }
    });
  });

});