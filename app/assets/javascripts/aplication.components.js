
/*
 *==================================================
 *===================== Slider =====================
 *==================================================
 * defaultInitValue:Boolean si contiene un false o nulo entonces inicializa 100% el slider
*/
function NestedSlider(defaultInitValue) {
    this.currentAvailablePercent = 100
    var currentAvailablePercent = this.currentAvailablePercent;
    var currentIncrementationPercent = 0;
    var totalPercent = 100;
    var defaultInitValue=defaultInitValue==false?false:true;

    this.initSlider = function ( slider_id, input_id ){
        var storedSliderValue=0;
        var tmpLimit=0;
        slider_id.slider({
            range: "min",
            min: 0,
            create: function(event,result) {
                if(currentAvailablePercent>0 && defaultInitValue){
                    currentIncrementationPercent = currentAvailablePercent + currentIncrementationPercent;
                    storedSliderValue = currentAvailablePercent + storedSliderValue;
                    $(this).slider('value', storedSliderValue);
                }
                storedSliderValue = $(this).slider("values", 0);
                currentAvailablePercent = totalPercent - currentIncrementationPercent;
            },
            slide: function(event, result) { //When the slider is sliding
                tmpLimit = storedSliderValue + currentAvailablePercent;
                if(parseInt(result.value)<tmpLimit) {
                    currentIncrementationPercent = currentIncrementationPercent - storedSliderValue;
                    currentIncrementationPercent = currentIncrementationPercent + parseInt(result.value);
                    currentAvailablePercent = 100 - currentIncrementationPercent;
                    storedSliderValue = parseInt(result.value);
                }else{
                    if(currentAvailablePercent>0){
                        currentIncrementationPercent = currentAvailablePercent + currentIncrementationPercent;
                        storedSliderValue = currentAvailablePercent + storedSliderValue;
                        $(this).slider('value', storedSliderValue);
                    }
                    storedSliderValue = $(this).slider("values", 0);
                    currentAvailablePercent = totalPercent - currentIncrementationPercent;
                }
                if( parseInt(result.value) > ( storedSliderValue+currentAvailablePercent ) ){
                    input_id.val(storedSliderValue);
                    return false;
                }else{
                    input_id.val(result.value);
                }
            },
            change: function(event, result) {
                $('#total_nested_evaluation').html('Total: '+currentIncrementationPercent+'%');
            }
        });
        input_id.val( slider_id.slider("values", 0) );
        $('#total_nested_evaluation').html('Total: '+currentIncrementationPercent+'%');
        input_id.keyup(function() {
            slider_id.slider('value', $(this).val());
        });
    };
}


/*
 *==================================================
 *==================== DropDown ====================
 *==================================================
 */



/*
 *==================================================
 *==================== Uploader ====================
 *==================================================
 */

function Uploader( id_asset_box , id_label_box ) {

    var nestedUploadDelivery    = $(id_asset_box).html();  //se extrae el elemento con ID 0 y se guarda en memoria
    var controlNestedUpload     = 0;
    $( id_asset_box ).empty();

    $( nestedUploadDelivery ).each(function( index, value ) {
        changeAttrUpload( $(value).clone() , id_asset_box );
    });
    initChangeLabel(controlNestedUpload);
    controlNestedUpload++;

    /*
     *
     * Value:Object     = Contiene el objeto Asset este es clonado y guardado en memoria, se envia para ser agregado al DOM
     * parentId:String  = Es el ID de la caja que contiene los assets
     *
     */

    function changeAttrUpload(value, parentId){
        var id_value = 'id';
        var id_name ='name';
        var str_id = $(value).attr(id_value);
        str_id = (str_id!=undefined)? str_id.replace('0',controlNestedUpload) : undefined;
        $(value).attr(id_value,str_id);
        var str_name = $(value).attr(id_name);
        str_name = (str_name!=undefined)?str_name.replace('0',controlNestedUpload):undefined;
        $(value).attr(id_name,str_name);
        $( $(value).children() ).each(function( index, value_local ) {
            var str_id = $(value_local).attr(id_value);
            str_id = (str_id!=undefined)? str_id.replace('0',controlNestedUpload) : undefined;
            $(value_local).attr(id_value,str_id);
            var str_name = $(value_local).attr(id_name);
            str_name = (str_name!=undefined)?str_name.replace('0',controlNestedUpload):undefined;
            $(value_local).attr(id_name,str_name);
        });
        $(parentId).append($(value));
    }

    function initChangeLabel( value ){
        var tmp_value = value;
        console.log( id_asset_box + ' #asset-file-'+ tmp_value );
        $(id_asset_box+' #asset-file-'+ tmp_value +'' ).change(function(){
            var fileName = $( id_asset_box + ' #upload-delivery-element-'+tmp_value+' > input[type=file]').val().replace(/C:\\fakepath\\/i, '');
            console.log(id_label_box);
            $(id_label_box).append('<div class="file-mini-upload">'+ fileName + '</div>');
            $( id_asset_box + ' #upload-delivery-element-'+tmp_value).hide();

            $( nestedUploadDelivery ).each(function( index, value ) {
                changeAttrUpload( $(value).clone(), id_asset_box);
            });
            initChangeLabel(controlNestedUpload);
            controlNestedUpload++;
            $(id_label_box).show();
        });
    }
}
