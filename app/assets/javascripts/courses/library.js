$(document).ready(function() {
  
  $.ajaxSetup({timeout:120000});

  function humanSize (size) {
    var b = [1<<30, 1<<20, 1<<10], s = ['GB', ' MB', ' kB'];
    for (var i in b) if (size >= b[i]) return (size/b[i]).toFixed(1) + s[i];
  }
  
  if ( $('#upload-files-to-course').length != 0 ) {

    $('#upload-files-to-course').fileupload({
      dataType: "script",
      timeout:  120000,
      add:      function(e,data) {
          data.context = $(tmpl("template-upload-2", data.files[0]));
          $('#uplok').append(data.context);
          data.submit().error(function (jqXHR, textStatus, errorThrown) {});
      },
      progress:function(e,data) {
        if( data.context ) {
          progress = parseInt(data.loaded / data.total * 100,0);
          speed = humanSize(data.bitrate / 8) + '/s';
          data.context.find('.progress-add').html(speed + ' '+ progress+"%" );
          data.context.find('.progress_exact').css('width',progress+ "%");
          
          if (progress == 100) {
            data.context.find('.deletedprogresbar').hide();
          }      
        }
      }
    });
  }
});