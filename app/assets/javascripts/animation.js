$(document).ready(function() {

    var prePostHeight = $('.pre-post-form').height();
    var time = 500;
    var timeSlide = time-100;

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

    $('.pre-post-form').click(function() {

        $('.pre-post-form').animate({
            opacity: 0.0,
            height: '0'
        }, time, function() {
            $(this).css('display','none');
        });

        $('#post').animate({
            height: $('#comment-form').height()
        }, time);

        console.log('test');

        $('#comment-form').css('display','block');

        $('#comment-form').animate({
            opacity: 1
        }, time);
    });
    $('#cancel-post-form').click(function() {

        $('#post').animate({
            height: '0'
        }, time);
        $('#comment-form').animate({
            opacity: 0
        }, time, function() {
            $(this).css('display','none');
        });

        $('.pre-post-form').css('display','block');
        $('.pre-post-form').animate({
            opacity: 1,
            height: prePostHeight
        }, time);
    });

    $('#new-course').click(function(){
        moveOutSlide('');
    });

    $('#cancel-course-form') .click(function(){
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