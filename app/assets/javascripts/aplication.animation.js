//var checkBox = null;
$(document).ready(function() {

    var time = 500;
    var timeSlide = time-100;

    //-----Titles Cover Photo -----
    var control_height = false;
    var tmp_height = 140;

    $('#settings').click(function() {
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


    //-----STATS -----

    //-----Titles Cover Photo -----
    var control_height_2 = false;
    var tmp_height_2 = 140;

    $('#stats').click(function() {
        if (control_height_2){
            tmp_height_2 = 140;
            control_height_2=false;
        }else{
            tmp_height_2 = 240;
            control_height_2=true;
        }
        $('#banner-profile').animate({
            height: tmp_height_2+'px'
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
            resetForm($(value).find('form'));
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

    //-------Courses Slide & Height animation------
    var tmp_height_new_course = $('#form-new-course').height();
    var tmp_height_new_course_box = null;
    $('#new-course-btn').click(function(){
        tmp_height_new_course_box = $('#box-course').height();
        $('#box-course').animate({
            height: tmp_height_new_course+'px'
        }, 400);

        moveOutSlide();

        var nestedNewCourseSlider = new NestedSlider(false);
        nestedNewCourseSlider.initSlider ( $('#slider-course-1'), $('#course_survey_param_evaluation') );
        nestedNewCourseSlider.initSlider ( $('#slider-course-2'), $('#course_delivery_param_evaluation') );
    });

    $('#cancel-course-form, #return-course') .click(function(){
        $('#box-course').animate({
            height: tmp_height_new_course_box+'px'
        }, 400, function() {
            //$(this).css('display','none');
            //$(this).css('height','');
        });
        moveInSlide();


        resetForm($('#new_course'));
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
    });


    //Menu post buttons
    var borderShadow = undefined;
    var borderMargin = undefined;
    var iconShadow = undefined;
    var iconMargin = undefined;
    var iconBackgroundColor = undefined;
    var iconBorderColor = undefined;
    /*function hoverBtn(){
        borderShadow = $(this).css('box-shadow');
        borderMargin = $(this).css('margin');
        iconShadow = $(".create .comment .icon").css('box-shadow');
        iconMargin = $(".create .comment .icon").css('margin');
        iconBorderColor = $(".create .comment .icon").css('border-color');
        iconBackgroundColor = $(".create .comment .icon").css('background-color');
        $(this).animate({
            boxShadow: '0px 1px 0px #FFF',
            margin:     '1px 0px 3px 18px'
        });

        $(".create .comment .icon").animate({
            boxShadow: '0px 2px 5px #555',
            margin:     '-1px 0px 0px -2px',
            backgroundColor: '#1d7ece',
            borderColor:'#045497'
        }, 400);
    }*/

    $("#message-form-btn").hover(function() {
        hoverBtn( '#'+$(this).attr('id') );
        console.log($(this).attr('id'))
    }, function() {
        hoverOutBtn( '#message-form-btn' );
    });


});

//Menu post buttons
var borderShadow;
var borderMargin;
var iconShadow;
var iconMargin;
var iconBackgroundColor;
var iconBorderColor;

function hoverBtn( obj ){
    borderShadow = $(obj +' .border').css('box-shadow');
    borderMargin = $(obj +' .border').css('margin');
    iconShadow = $(".create "+ obj +" .icon").css('box-shadow');
    iconMargin = $(".create "+ obj +" .icon").css('margin');
    iconBorderColor = $(".create "+ obj +" .icon").css('border-color');
    iconBackgroundColor = $(".create "+ obj +" .icon").css('background-color');

    $(obj +' .border').animate({
        boxShadow: '0px 0px 0px #FFF',
        margin:     '3px 0px 3px 18px'
    });

    $(".create "+obj+" .icon").animate({
        boxShadow: '0px 2px 5px #555',
        margin:     '-2px 0px 0px -2px',
        backgroundColor: '#1d7ece',
        borderColor:'#045497'
    }, 400);
}
function hoverOutBtn(obj){
    $(obj+' .border').animate({
        boxShadow: borderShadow ,
        margin:     borderMargin
    });
    $(".create "+obj+" .icon").animate({
        boxShadow: iconShadow,
        margin:     iconMargin,
        backgroundColor: '#4fa3e9' ,
        borderColor: iconBorderColor
    });
}
