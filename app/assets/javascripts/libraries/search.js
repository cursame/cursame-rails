$('.search').submit(function(event) {
  var input = $('#search-query');
  if( input.val().trim() == "" ) {
    Notice('error', 'Escribe en el campo de busqueda.');
    input.focus();
    return false;
  }
});
