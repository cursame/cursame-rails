$(function() {
	window.createModal = function (content) {
		$('.modalia').hide(); //si existe algún modalia abierto
		$('.overlayia').hide(); //si existe algún modalia abierto
		$('body').append('<div class="overlayia"></div>').show();
		$('body').append('<div class="modalia" ></div>').show();
		$('.modalia').html(content);
	};
		
	$('.overlayia').live('click',function () {
		$('.modalia').hide();
		$(this).hide();
	});
});
