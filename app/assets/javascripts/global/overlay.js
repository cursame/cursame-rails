window.overlayPositioning = function ( overlay, f ) {
    var winHeight     = $(window).height(),
        winWidth      = $(window).width(),
        overlayHeight = overlay.outerHeight(),
        overlayWidth  = overlay.outerWidth();

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
      });
    };
  };

window.createModal = function ( content, classes ) {
  $('body').addClass('overlay-open').append('<div class="overlay-wrapper"></div>');
  $('div.overlay-wrapper').append('<div class="overlay-screen"></div>').show().append('<div class="overlay '+ (classes ? classes : "") +'"></div>').show();
  $('div.overlay-wrapper').css("overflow-y", "scroll").css('-webkit-overflow-scrolling', 'touch');

  $('.overlay').html(content);
  overlayPositioning( $('.overlay') );
};

window.removeModal = function() {
  var removable = $('.overlay').hasClass('not-removable');

  if ( !removable ) {
    removeModalAction( $('.overlay') );
  };
};

window.removeModalAction = function( overlay, f ) {
  f = f || undefined;
  $('.overlay-wrapper').remove();
  $('body').removeClass('overlay-open');
  if ( f && typeof f == 'function') {
    f();
  };
};

$(function() {	
	$('.overlay-screen, .close-overlay').live('tap', removeModal );

	$(window).on('resize', function() {
    overlayPositioning( $('div.overlay') );
    Chat.assignSpots();
    // Chat.repositionPanelOnWidth();
  });

  $('[data-modal="true"]').on('tap', function(event) {
    var $this = $(this),
        url   = $this.attr('href');

    $.ajax({ type: "GET", url: url });
    event.preventDefault();
  });

	/* Show delivery submit form */
  $('.show-delivery-form').live('tap', function(e) {
    var $this = $(this);

    $this.closest('.delivery-overlay-content').hide();
    var target = $this.closest('.overlay').children('.delivery-overlay-submit-form');

    target.show().find(':input:enabled:visible:first').focus();

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
