$(function() {

	function overlayPositioning( overlay ) {
		var	winHeight 		= $(window).height(),
				winWidth			= $(window).width(),
				overlayHeight = overlay.outerHeight(),
				overlayWidth 	= overlay.outerWidth();

		overlay.css({
			'left': winWidth/2 - overlayWidth/2,
			'top': winHeight/2 - overlayHeight/2
		})
	}
	
	window.createModal = function (content) {
		$('body').append('<div class="overlay-wrapper"></div>').css("overflow","hidden");
		$('div.overlay-wrapper').append('<div class="overlay-screen"></div>').show().append('<div class="overlay" ></div>').show();
		$('.overlay').html(content);

		overlayPositioning( $('.overlay') );
	};
	
	$('.overlay-screen, .close-overlay').live('click',function () {
		$('.overlay-wrapper').remove();
		$('body').css("overflow", "");
	});

	$(window).on('resize', function() {
    overlayPositioning( $('.overlay') );
  });

});
