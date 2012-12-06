$(document).ready(function() {

    var prePostHeight = $('#pre-post-form').height();
    var time = 500;
    var timeSlide = time+100;


    $('#pre-post-form').click(function() {

        $('#pre-post-form').animate({
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

        $('#pre-post-form').css('display','block');
        $('#pre-post-form').animate({
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
        $('#course-list').hide(
            "slide", { direction: "left" }, 1000
        );
        $('#form-new-course').show(
            "slide",
            {
                direction: "right"
            },1000);
    }

    function moveOutSlide(){
        $('#course-list').hide(
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
        $('#course-list').show(
            "slide", { direction: "left" }, timeSlide
        );
    }
})