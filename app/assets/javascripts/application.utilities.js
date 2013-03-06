/*
 *==================================================
 *=================== Reset Form ===================
 *==================================================
 */

//  Trigger: resetForm( '#idDoom' );
//  Return: $('#idDoom') resetfields

function resetForm(objForm){
    objForm[0].reset();

    //removing assets
    $.each($(objForm).find('.file-master-input-box').children(), function(index, value) {
        console.log();
        if(!$(value).is(":visible")){
            $(value).remove();
        }
    });
    $(objForm).find('.upload-label').empty().hide();
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