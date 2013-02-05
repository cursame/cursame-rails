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


    $('.message-form-btn, .delivery-form-btn, .discussion-form-btn').hover(function() {
        switch ($(this).attr('class')) {
            case "message-form-btn":
                hoverBtn( '.message-form-btn','#045497', '#1d7ece');
                break;
            case "delivery-form-btn":
                hoverBtn( '.delivery-form-btn','#4a6e06', '#70a50c');
                break;
            case "discussion-form-btn":
                hoverBtn( '.discussion-form-btn','#949300', '#bcba00');
                break;
        }
    }, function() {
        hoverOutBtn( '.'+$(this).attr('class') );
    });


});

//Menu post buttons
var borderShadow;
var borderMargin;
var iconShadow;
var iconMargin;
var iconBackgroundColor;
var iconBorderColor;

function hoverBtn( obj , borderColor, backgroundColor){
    borderShadow = $(obj +' .border').css('box-shadow');
    borderMargin = $(obj +' .border').css('margin');
    iconShadow = $(obj +" .icon").css('box-shadow');
    iconMargin = $(obj +" .icon").css('margin');
    iconBorderColor = $(obj +" .icon").css('border-color');
    iconBackgroundColor = $(obj +" .icon").css('background-color');

    $(obj +' .border').animate({
        boxShadow: '0px 0px 0px #FFF',
        margin:     '3px 0px 3px 18px'
    }, 200);

    $(obj+" .icon").animate({
        boxShadow: '0px 2px 5px #555',
        margin:     '-2px 0px 0px -2px',
        backgroundColor: backgroundColor,
        borderColor:borderColor
    }, 200);
}
function hoverOutBtn(obj){
    $(obj+' .border').animate({
        boxShadow: borderShadow ,
        margin:     borderMargin
    }, 200);
    $(obj+" .icon").animate({
        boxShadow: iconShadow,
        margin:     iconMargin,
        backgroundColor: iconBackgroundColor ,
        borderColor: iconBorderColor
    }, 200);
}