// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function(){
	$('#new_assets').fileupload({
		dataType: "script",
		add:function(e,data){
			data.context = $(tmpl("template-upload",data.files[0]));
			$('#new_assets').append(data.context);
			data.submit();
		},
		progress:function(e,data){
			if(data.context){
				progress = parseInt(data.loaded / data.total * 100,0);
				data.context.find('.bar').css('width',progress+ "%");
			}
		}
	});
});