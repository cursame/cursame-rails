function RemachForLazyLoadQuestion(){
  var rand, lastBoxIMg, lastIMgLPrev, changeIDChildx, lasImgButton, changeIDturboIMgbutton, lasImgInput, lasImgInputId, aId, nExtDiv, childImg, act_function;
  rand = Math.floor((Math.random() * 390) + 1);
  lastBoxIMg = $('.select_viwver_question').last();
  lastIMgLPrev = $('.img_viewver_question').last();
  lasImgButton = $('.button_question_field').last();
  lasImgInput = $('.prev_input').last();
  changeIDChildx = $(lastBoxIMg).attr('id');
  changeIDChildx = changeIDChildx + '_' + rand;
  changeIDturboIMg = $(lastIMgLPrev).attr('id');
  changeIDturboIMg = changeIDturboIMg + '_' + rand;
  changeIDturboIMgbutton = $(lasImgButton).attr('id');
  changeIDturboIMgbutton = changeIDturboIMgbutton + '_' + rand;
  lasImgInputId = $(lasImgInput).attr('id');
  $(lastBoxIMg).attr('id', changeIDChildx);
  $(lastIMgLPrev).attr('id', changeIDturboIMg);
  $(lasImgButton).attr('id', changeIDturboIMgbutton);
  aId = changeIDturboIMgbutton;
  nExtDiv = changeIDChildx;
  childImg = changeIDturboIMg;
  act_function =  'LazyReader('+ "'" + aId +"'" +' , '+"'" + nExtDiv+"'" +' , '+"'" + childImg+"'" +' , '+"'" + lasImgInputId+"'" + ");";
  $('#'+changeIDturboIMgbutton).attr('onclick', act_function);
}

function RemachForLazyLoadAnswer(){
  var rand, lastBoxIMg, lastIMgLPrev, changeIDChildx, lasImgButton, changeIDturboIMgbutton, lasImgInput, lasImgInputId, aId, nExtDiv, childImg, act_function;
  rand = Math.floor((Math.random() * 390) + 1);
  lastBoxIMg = $('.select_viwver_answer').last();
  lastIMgLPrev = $('.img_viewver_answer').last();
  lasImgButton = $('.button_answer_field').last();
  lasImgInput = $('.prev_input_answer').last();
  changeIDChildx = $(lastBoxIMg).attr('id');
  changeIDChildx = changeIDChildx + '_' + rand;
  changeIDturboIMg = $(lastIMgLPrev).attr('id');
  changeIDturboIMg = changeIDturboIMg + '_' + rand;
  changeIDturboIMgbutton = $(lasImgButton).attr('id');
  changeIDturboIMgbutton = changeIDturboIMgbutton + '_' + rand;
  lasImgInputId = $(lasImgInput).attr('id');
  $(lastBoxIMg).attr('id', changeIDChildx);
  $(lastIMgLPrev).attr('id', changeIDturboIMg);
  $(lasImgButton).attr('id', changeIDturboIMgbutton);
  aId = changeIDturboIMgbutton;
  nExtDiv = changeIDChildx;
  childImg = changeIDturboIMg;
  act_function =  'LazyReader('+ "'" + aId +"'" +' , '+"'" + nExtDiv+"'" +' , '+"'" + childImg+"'" +' , '+"'" + lasImgInputId+"'" + ");";
  $('#'+changeIDturboIMgbutton).attr('onclick', act_function);
}


function LazyReader(aId, nExtDiv, childImg, lasImgInputId){
  var InputChildren, InputChildrenId, target, div_to_open,  div, TimeoutIM;
  target = childImg;
  div_to_open = nExtDiv;
  div  = lasImgInputId;
  var timerING = setTimeout(function(){
    LazyOppen(aId, lasImgInputId)
  }, 1000);
  LazyOppen(lasImgInputId);
  $('#'+div).change(function(){
    readURL(this, target, div_to_open);
    window.clearTimeout(timerING);

  });
}

function LazyOppen(aId, lasImgInputId){
  $('#'+lasImgInputId).trigger('click');
}

function readURL(input, target, div_to_open) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
			var onix = $('#'+target).attr('src', e.target.result);
      $('#'+div_to_open).show();
      return false;
		}
		reader.readAsDataURL(input.files[0]);
    return false;
	}
}

