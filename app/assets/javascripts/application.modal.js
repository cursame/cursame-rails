$(function() {

	function overlayPositioning( overlay ) {
		var	winHeight 		= $(window).height(),
				winWidth			= $(window).width(),
				overlayHeight = overlay.outerHeight(),
				overlayWidth 	= overlay.outerWidth();

		if ( winHeight > overlayHeight ) {
			overlay.removeClass('not-height')
			overlay.css({
				'left': winWidth/2 - overlayWidth/2,
				'top': winHeight/2 - overlayHeight/2
			});
		} else {
			overlay.addClass('not-height');
			overlay.css({
				'left': 0,
				'top': 0
			})
		}
	}
	
	window.createModal = function (content) {
		$('body').addClass('overlay-open').append('<div class="overlay-wrapper"></div>');
		$('div.overlay-wrapper').append('<div class="overlay-screen"></div>').show().append('<div class="overlay" ></div>').show();
		$('div.overlay-wrapper').css("overflow-y", "scroll");
		$('.overlay').html(content);

		overlayPositioning( $('.overlay') );

	};
	
	$('.overlay-screen, .close-overlay').live('click',function () {
		$('.overlay-wrapper').remove();
		$('body').removeClass('overlay-open');
	});

	$(window).on('resize', function() {
    overlayPositioning( $('div.overlay') );
  });

	/* Show delivery submit form */
  $('.show-delivery-form').live('click', function(e) {
    var $this = $(this),
        target = $this.data('target-id');

    $this.closest('.delivery-overlay-content').hide();
    $('div#' + target).show();

    overlayPositioning( $('div.overlay') );    
    e.preventDefault();
  });

});
