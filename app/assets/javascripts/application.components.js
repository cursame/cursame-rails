
/*
 *==================================================
 *===================== Slider =====================
 *==================================================
*/
function NestedSlider(defaultInitValue) {

    var currentAvailablePercent = 100;
    var currentIncrementationPercent = 0;
    var totalPercent = 100;
    var defaultInitValue=defaultInitValue==false?false:true;

    console.log(defaultInitValue);
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