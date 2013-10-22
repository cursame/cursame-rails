// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//

//= require_raphael
//= require_morris
//= require private_pub
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require_tree

// Adding and removing questions answers
function remove_fields(link, toId) {
    console.log(toId);
    if(toId == '#box-question') {
        $(link).parent().parent().remove();
        changeNumbers('#box-question', '#question-num');
    } else if( toId =='#box-request' ) {
        var grandfather = $(link).parent().parent();
        $(link).parent().remove();
        changeNumbers(grandfather, '#request-num');
    }
}

function add_fields(link, association, content, toId) {
    //toId catch:
    //  #box-request
    //  #box-question
	var new_id = new Date().getTime();
	var regexp = new RegExp("new_" + association, "g");
    if(toId =='#box-question'){
        $(toId).append(content.replace(regexp, new_id));
        changeNumbers('#box-question', '#question-num');
    }else if( toId =='#box-request' ){
        $(link).parent().parent().find('#box-request').append(content.replace(regexp, new_id));
        changeNumbers($(link).parent().parent().find('#box-request'), '#request-num');
    }
}

function changeNumbers(idParent, idFind){
    var count = 0 ;
    var alphabet= new Array('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z');
    if(idFind == '#question-num'){
        $.each($(idParent).children(), function(index, value) {
            $(value).find('#question-num').html(count+1+'. ');
            count ++;
        });
    }else if( idFind =='#request-num' ){
        $.each(idParent.children(), function(index, value) {
            $(value).find('#request-num').html(alphabet[count]+') ');
            //console.log($(value).attr('id'));
            count ++;
        });
    }
    var count = 0 ;
}

// notificaciones push usando private_pub
$(function() {

	// Se suscribe al canal para las notificaciones del chat
	PrivatePub.subscribe ("/messages/notifications_user_" + Cursame.userId, function(data, channel) {
        var url, notification, numNotifications;
		var channelType = data.channel.channel_name.split('course_channel_');
		url = channelType[1] ? '/home/open_channel/' + channelType[1] + '?course=true' : '/home/open_channel/' + data.sender.id;		

		notification = ['<li class="unread">',
			'<a href="' + url + '" data-remote="true">Conversar</a></br>',
			'<img src="' + data.sender.avatar.modern.url + '" class="avatar-notifications avatar-mini">',
			'<b>'+data.sender.first_name+' '+data.sender.last_name+'</b><br/>'+data.message.mesage,
			'<br/><span class="time">'+jQuery.timeago(data.message.created_at)+'</span>',
			'</li>'];

		//si ya existe la conversacion no se crea la notificación
		if($('#chat-channel-'+data.channel.id).length) {
			var panel = $("#chat-channel-" + data.channel.id);
	    	var chatZonePosition = $(panel).css('bottom');
	    	
            // aqui agrego un asterisco a la ventanita
            // cuando esta collapsada, asi sabe cuando el usario tiene un msj pendiente esa ventana
            if(chatZonePosition.replace('px','') < 200) {
	    		$("#chat-channel-"+data.channel.id+ " span").append('*');
	    	}
            
            // alineamos los comentarios que no son de nosotros a la derecha
            setTimeout(function () {
                $('#message_' + data.message.id).css('float','right');
            }, 200);
            
		} else {
			numNotifications = $('#messages-notifications-count span').html() * 1;
			$('#messages-notifications-count span').html(numNotifications + 1);
			$('#messages-notifications-list').prepend(notification.join(''));
		}
	});
});