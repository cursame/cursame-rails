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

    $('#post-btns > a').click(function() {
        var hrefClean = $(this).attr('href');
        $(this).parent().parent().animate({  // Se va por $('#profile-form-options')
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
})