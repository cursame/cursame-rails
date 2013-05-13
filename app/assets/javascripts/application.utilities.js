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
/**
 * sobresalir una div con efecto tumblr
 * @return {} the element overlay
 */
function goFront(element){
    $overlay = $('<div class="ui-widget-overlay" id="overlaymask"></div>');
    $modal = $('<div class="cursame-modal" id="cursame-modal">hgfdsaas</div>');
    $forms =  $('#post-forms');
    $('body').append($overlay, $modal);

    var position = $forms.position();

    var top = Math.max($(window).height(), 0) / 2;
    var left = Math.max($(window).width(), 0) / 2;

    $modal.css({
        top:position.top ,//+ $(window).scrollTop(),
        left:position.left// + $(window).scrollLeft()
    });

    $modal.append($forms);
    //mostramos el overlay
    $('#overlaymask').show();
    $('#cursame-modal').show();

}
/**
 * esconder el div efecto tumblr
 * @return {} the lement to hide
 */
function goBack(form,parent){
    $form =  $(form);
    $('parent').append($form);
    //mostramos el overlay
    $('#overlaymask').destroy();
    $('#cursame-modal').destoy();
}