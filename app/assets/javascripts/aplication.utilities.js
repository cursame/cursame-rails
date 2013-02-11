/*
 *==================================================
 *=================== Reset Form ===================
 *==================================================
 */

//  Trigger: resetForm( '#idDoom' );
//  Return: $('#idDoom') resetfields

function resetForm(objForm){
    objForm[0].reset();
}

/**
 * Funcion que enmascara un div dinamicamente
 * puede tener un boton en medio
 * idOrCls el id o cls del DOM
 * msj el mensaje a mostrar
 */
function mask(idOrCls,msj){
	$('<div class="ui-widget-overlay" id="mask"><span>'+msj+'</span></div>').appendTo(idOrCls);
	$('#mask').show();
}
/**
 * Funcion que quita la mascara un div dinamicamente
 * puede tener un boton en medio
 * idOrCls el id o cls del DOM
 */
function unmask(idOrCls){
	$('#mask').hide();
}