//=================================================================
// When I wrote this, only God and I understood what I was doing
// Now, God only knows - RodrigoAyala.me
//=================================================================

$(document).ready(function() {

    var time = 500;
    var timeSlide = time-100;

    /*
     *======================================================================
     *==================== Animation - Cover Photo Menu ====================
     *======================================================================
     *
     * El metodo $('#banner-btns > li').click() reconoce los elementos que contiene la caja "box-titles"
     * y los relaciona con "box-titles-content", busca el tamaño de los contenedores, e inicializa la animación.
     *
     * Variables HTML obligatorias:
     *    get-to:Id_box (Id de la caja)
     *    move-sidebar-height:Pixels (Pixeles que se recorrera el sidebar)
     *
     * Ejemplo:
     *
     * <div id="box-titles">
     *    <ul id="banner-btns" class="list-header">
     *       <li class="calendar" get-to="#calendar-area" move-sidebar-height="36px" >Calendario</li>
     *    </ul>
     * </div>
     * <div id="box-titles-content" class="box-titles-content-style">
     *    <div id="calendar-area">
     *        <img src="/assets/calendar/calendar.png" >
     *    </div>
     * </div>
     *
     */

    var defaultBannerHeight = 140;
    var getElementId = undefined;
    var tmpGetElementId = undefined;
    var isOpen = undefined;
    $('#banner-btns > li').click(function() {
        getElementId = $(this).attr('get-to');

        onLoadElement = $(this).attr('on-load');

        if(tmpGetElementId==getElementId){
            if(isOpen){
                closeBannerAnimation(tmpGetElementId);
                isOpen = false;
            }else{
                openBannerAnimation( getElementId, defaultBannerHeight + $(getElementId).height() , $(this).attr('move-sidebar-height') );
                isOpen = true;
            }
        }else if(tmpGetElementId != undefined && tmpGetElementId!=getElementId){
            if(isOpen && tmpGetElementId!=getElementId){
                closeAndOpenBannerAnimation(tmpGetElementId, getElementId, defaultBannerHeight + $(getElementId).height() , $(this).attr('move-sidebar-height'));
                isOpen = true;
            }else if(isOpen){
                closeBannerAnimation(tmpGetElementId);
                openBannerAnimation( getElementId, defaultBannerHeight + $(getElementId).height() , $(this).attr('move-sidebar-height') );
                isOpen = false;
            }else{
                openBannerAnimation( getElementId, defaultBannerHeight + $(getElementId).height() , $(this).attr('move-sidebar-height') );
                isOpen = true;
            }
        }else{
            openBannerAnimation( getElementId, defaultBannerHeight + $(getElementId).height() , $(this).attr('move-sidebar-height') );
            isOpen = true;
        }
        tmpGetElementId = getElementId;
    });
    function closeBannerAnimation(elementHide){
        $('#banner-profile').animate({
            height: defaultBannerHeight+'px'
        }, time, function() {
            $(elementHide).hide();
        });
        $('#side-bar').animate({
            padding: '0px 0px 0px 0px'
        }, time);
    }
    function openBannerAnimation( elementHide, bannerProfileHeight , slideBarPaddValue ){
        $(elementHide).show();
        $('#banner-profile').animate({
            height: bannerProfileHeight+'px'
        }, time, function(){
            if(onLoadElement=="calendar")
                initCalendar();
        });
        $('#side-bar').animate({
            padding: slideBarPaddValue + ' 0px 0px 0px'
        }, time);
    }
    function closeAndOpenBannerAnimation( elementHide, elementShow, bannerProfileHeight , slideBarPaddValue ){
        $('#banner-profile').animate({
            height: defaultBannerHeight+'px'
        }, time, function() {
            $(elementHide).hide();
            $(elementShow).show();
            $('#banner-profile').animate({
                height: bannerProfileHeight+'px'
            }, time);
            $('#side-bar').animate({
                padding: slideBarPaddValue + ' 0px 0px 0px'
            }, time);
        });
        $('#side-bar').animate({
            padding: '0px 0px 0px 0px'
        }, time);
        if(onLoadElement=="calendar")
            initCalendar();
    }

    var initBool = true;

    function initCalendar(){
        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();
        if(initBool){
            var calendar = $('#calendar_g').fullCalendar({
                weekMode: 'variable',
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: ''
                },
                selectable: true,
                selectHelper: true,
                select: function(start, end, allDay) {
                    var title = prompt('Event Title:');
                    if (title) {
                        calendar.fullCalendar('renderEvent',
                            {
                                title: title,
                                start: start,
                                end: end,
                                allDay: allDay
                            },
                            true // make the event "stick"
                        );
                    }
                    calendar.fullCalendar('unselect');
                },
                editable: true,
                events: events
            });
            initBool = false;
        }
        /* this function execute the calendar list */
        $.each(event_list, function(index, value) {
          $('#event_list').append(value.title + ' - '+ value.end + '<br>');
        });
        

    }


    /*
     *===============================================================
     *==================== Animation - MenuPost ====================
     *===============================================================
     */
    var prePostHeight = $('#profile-form-options').height();
    var prePostMargin = $('#profile-form-options').css('margin');
    $('#profile-form-options > a').click(function() {
        var hrefClean = $(this).attr('href');
        $(this).parent().animate({  // Se va por $('#profile-form-options')
            opacity: 0.0,
            height: '0',
            margin: '0'
        }, time, function() {
            $(this).css('display','none');
        });
        $('#post-forms').animate({
            height: $( hrefClean ).height()
        }, time);
        $( hrefClean ).css('display','block');
        $( hrefClean ).animate({
            opacity: 1
        }, time);
        return false;
    });
    //Cancel btns
    $('#post-forms > div').each(function( index, value ) {
        $(value).find('#cancel-post-form').click(function() {
            resetForm($(value).find('form'));
            console.log('cancelado');
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
                height: prePostHeight,
                margin: prePostMargin
            }, time);

        });
    });



    /*
     *=======================================================================================
     *==================== Animation - Items Menu Post (Circles) (Hover) ====================
     *=======================================================================================
     */
    $('.message-form-btn, .delivery-form-btn, .discussion-form-btn, .survey-form-btn').hover(function() {
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
            case "survey-form-btn":
                hoverBtn( '.survey-form-btn','#b26900', '#ec8e09');
                break;
        }
    }, function() {
        hoverOutBtn( '.'+$(this).attr('class') );
    });

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
            margin:     '3px 0px 3px 28px'
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

    /*
     *===========================================================================================
     *==================== Courses Animation (Create) - tabs, slide & resize ====================
     *===========================================================================================
     */

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
        $('#tabs-courses').hide("slide", {
            direction: "left"
        }, 1000);
        $('#form-new-course').show("slide",{
            direction: "right"
        },1000);
    }
    function moveOutSlide(){
        $('#tabs-courses').hide("slide", {
           direction: "left"
        }, timeSlide);
        $('#form-new-course').show("slide",{
            direction: "right"
        },timeSlide);
    }

    function moveInSlide(){
        $('#form-new-course').hide("slide",{
            direction: "right"
        },timeSlide);
        $('#tabs-courses').show("slide", {
            direction: "left"
        }, timeSlide);
    }
    $( "#tabs-courses" ).tabs();
    $( "#tabs-friends" ).tabs();


});