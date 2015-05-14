
function surveyOpenFileCall(div, target, div_to_open){
  $('#'+div).trigger('click');
  $('#'+div).change(function(){
     readURL(this, target, div_to_open);
  });
}

function readURL(input, target, div_to_open) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
			var onix = $('#'+target).attr('src', e.target.result);
			$('#'+div_to_open).show();
		}
		reader.readAsDataURL(input.files[0]);
	}
}


