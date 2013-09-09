#uploader
jQuery ->
  $('#new_course_file').fileupload
   dataType: "script"
   add: (e, data) ->
        data.context = $(tmpl("template-upload-2", data.files[0]))
        $('#uplok').append(data.context)
        data.submit()
    progress: (e, data) ->
         if data.context
           progress = parseInt(data.loaded / data.total * 100, 10)
           data.context.find('.progress_exact').css('width', progress + '%')
           if progress == 100 
                   data.context.find('.deletedprogresbar').hide()