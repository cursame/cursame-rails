
	// // funcionalidad para cargar el contenido dinamicamente sin que la url resulte afectada
	// $(function() {
	// var $main = $(".main");
	// 	$(document).on("click", "a", function() {
	// 		if ($(this).attr("data") == 'menu' && history.pushState) { //si se trata de una opcion de menu
	// 			var href = $(this).attr("href");
	// 			history.pushState({}, '', href);
	// 				$main.load(href + " .main>*", function() {
	// 			});
	// 		return false;
	// 		}
	// 	});
	// });