$(document).ready(function() {
    $(function() {
        $( "#course_init_date, #course_finish_date" ).datepicker({
            inline: true,
            //nextText: '&rarr;',
            //prevText: '&larr;',
            showOtherMonths: true,
            //dateFormat: 'dd MM yy',
            monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio','Julio', 'Augosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
            monthNamesShort: ['Jan', 'Feb', 'M&auml;r', 'Apr', 'Mai', 'Jun','Jul', 'Aug', 'Sep', 'Okt', 'Nov', 'Dez'],
            dayNamesMin: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab']
            //showOn: "button",
            //buttonImage: "img/calendar-blue.png",
            //buttonImageOnly: true,
        });

    })
})