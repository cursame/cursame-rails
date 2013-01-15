var checkBox = null;
$(document).ready(function() {

    var time = 500;
    var timeSlide = time-100;




    //-----Titles Cover Photo -----
    var control_height = false;
    var tmp_height = 140;

    $('#box-titles').click(function() {
        if (control_height){
            tmp_height = 140;
            control_height=false;
        }else{
            tmp_height = 275;
            control_height=true;
        }
        $('#banner-profile').animate({
            height: tmp_height+'px'
        }, time);
    });


    //----- Post Form Animations------
    var prePostHeight = $('#profile-form-options').height();

    $('#profile-form-options > a').click(function() {
        var hrefClean = $(this).attr('href');
        $(this).parent().animate({  // Se va por $('#profile-form-options')
            opacity: 0.0,
            height: '0'
        }, time, function() {
            $(this).css('display','none');
        });
        $('#post-forms').animate({
            height: $( hrefClean ).height()
        }, time);
        $( hrefClean ).css('display','block');
        $(hrefClean ).animate({
            opacity: 1
        }, time);
        return false;
    });
    //Cancel btns
    $('#post-forms>div').each(function( index, value ) {
        $(value).find('#cancel-post-form').click(function() {
            console.log($(this).parent().parent().attr('id'));
            $('#post-forms').animate({
                height: '0'
            }, time);
            $(this).parent().parent().animate({
                opacity: 0
            }, time, function() {
                $(this).css('display','none');
            });
            $('#profile-form-options').css('display','block');
            $('#profile-form-options').animate({
                opacity: 1,
                height: prePostHeight
            }, time);

        });
    });



    //-------Courses animation------
    $('#new-course').click(function(){
        moveOutSlide('');
    });

    $('#cancel-course-form, #return-course') .click(function(){
        moveInSlide();
    });

    function moveOutSlide(){
        $('#tabs-courses').hide(
            "slide", { direction: "left" }, 1000
        );
        $('#form-new-course').show(
            "slide",
            {
                direction: "right"
            },1000);
    }

    function moveOutSlide(){
        $('#tabs-courses').hide(
            "slide", { direction: "left" }, timeSlide
        );
        $('#form-new-course').show(
            "slide",
            {
                direction: "right"
            },timeSlide);
    }

    function moveInSlide(){
        $('#form-new-course').hide(
            "slide",
            {
                direction: "right"
            },timeSlide);
        $('#tabs-courses').show(
            "slide", { direction: "left" }, timeSlide
        );
    }

    $(function() {
        $( "#tabs-courses" ).tabs();
        $( "#tabs-friends" ).tabs();
    });





    function DropDown(el) {
        this.dd = el;
        this.opts = this.dd.find('ul.dropdown > li');
        this.val = [];
        this.index = [];
        this.initEvents();
    }
    DropDown.prototype = {
        initEvents : function() {
            var obj = this;

            obj.dd.on('click', function(event){
                $(this).toggleClass('active');
                event.stopPropagation();
            });

            obj.opts.children('label').on('click',function(event){

                var opt = $(this).parent(),
                    chbox = opt.children('input'),
                    val = chbox.val(),
                    idx = opt.index();
                //checked manual (se puede manejar automatico por ID pero tiene que se igual el Id del input con el for del label
                if ($(chbox).is(':checked')) {
                    $(chbox).prop('checked', false);
                } else {
                    $(chbox).prop('checked', true);
                }

                //console.log($(opt).attr('name'));
                //($.inArray(val, obj.val) !== -1) ? obj.val.splice( $.inArray(val, obj.val), 1 ) : obj.val.push( val );
                //($.inArray(idx, obj.index) !== -1) ? obj.index.splice( $.inArray(idx, obj.index), 1 ) : obj.index.push( idx );
                event.stopPropagation();

            });
        },
        getValue : function() {
            return this.val;
        },
        getIndex : function() {
            return this.index;
        }
    }


    var dd = new DropDown( $('#CourseDropDown') );

    $(document).click(function() {
        // all dropdowns
        $('.wrapper-dropdown').removeClass('active');
        console.log('entro')
    });

})