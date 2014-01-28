$(function() {
	$('a').click(function() {
		var me = $(this);
		if (me.attr('data') === 'modal') {
			$('.modalia').hide(); //si existe algún modalia abierto 
			$('body').append('<div class="overlayia"></div>').show();
			me.closest("div").find('.modalia').show();
		}
		return false;
	});
	$('.overlayia').live('click',function () {
		$('.modalia').hide();
		$(this).hide();
	});
});