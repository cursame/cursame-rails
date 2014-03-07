$(function() {

	window.overlayPositioning = function ( overlay, f ) {
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
	
	window.createModal = function ( content, classes ) {

		$('body').addClass('overlay-open').append('<div class="overlay-wrapper"></div>');
		$('div.overlay-wrapper').append('<div class="overlay-screen"></div>').show().append('<div class="overlay '+ (classes ? classes : "") +'"></div>').show();
		$('div.overlay-wrapper').css("overflow-y", "scroll");

    $('.overlay').html(content);
    overlayPositioning( $('.overlay') );
    $('.overlay').addClass('animated pulse');

	};

  window.removeModal = function() {
    var removable = $('.overlay').hasClass('not-removable');

    if ( !removable ) {
      removeModalAction( $('.overlay') );
    }
  };

  window.removeModalAction = function( overlay, f ) {
    overlay.addClass('animated bounceOut');
    overlay.one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
      $('.overlay-wrapper').fadeOut(250, function() {
        $(this).remove();
        if ( f && typeof f == 'function') {
          f();
        }
      });
      $('body').removeClass('overlay-open');
    });
  }
	
	$('.overlay-screen, .close-overlay').live('click', removeModal );

	$(window).on('resize', function() {
    overlayPositioning( $('div.overlay') );
  });

	/* Show delivery submit form */
  $('.show-delivery-form').live('click', function(e) {
    var $this = $(this);

    $this.closest('.delivery-overlay-content').hide();
    $this.closest('.overlay').children('.delivery-overlay-submit-form').show();

    overlayPositioning( $('div.overlay') );
    e.preventDefault();
  });

  /* Hide delivery submit form */
  $('.cancel-delivery-submit').live('click', function(e) {
    var $this = $(this);

    $this.closest('.delivery-overlay-submit-form').hide();
    $this.closest('.overlay').children('.delivery-overlay-content').show();

    overlayPositioning( $('div.overlay') );

    e.preventDefault();
  });

  /* Add Class to answer survey overlay */
  $('.survey-question-answer input').live('click', function() {
    $(this).parent().toggleClass('active');
    $(this).closest('li').toggleClass('active');
  });
});
