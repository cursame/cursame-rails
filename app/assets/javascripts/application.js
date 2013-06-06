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
    if(toId =='#box-question'){
        $(link).parent().parent().remove();
        changeNumbers('#box-question', '#question-num');
    }else if( toId =='#box-request' ){
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
//notificaciones push usando private_pub
$(function() {
	PrivatePub.subscribe ("/notifications/"+Cursame.userId, function(data, channel){
		$('#notifications_count span').html(data.num*1);
		var notification = "", type = data.notification.notificator_type, id=data.notification.id;
		var creator;
		if (data.creator){
			name = (data.creator.first_name && data.creator.last_name) ? data.creator.first_name +' '+ data.creator.last_name : data.creator.email;
		} 
		switch(data.notification.kind){
			case 'user_comment_on_network':
			notification = ['<li class="unread" onclick="me(type,id)">',
			'<img src="'+data.creator.avatar.modern.url+'" class="avatar-notifications avatar-mini">',
			'<b>'+name+'</b> comentó en la red <b>'+data.owner.name+'</b><br/>',
			'<span class="time">'+jQuery.timeago(data.notification.created_at)+'</span>',
			'</li>'];
			break;
			case 'user_comment_on_course':
			notification = ['<li class="unread" onclick="me(type,id)">',
			'<img src="'+data.creator.avatar.modern.url+'" class="avatar-notifications avatar-mini">',
			'<b>'+name+'</b> comentó en el curso <b>'+data.owner.title+'</b><br/>',
			'<span class="time">'+jQuery.timeago(data.notification.created_at)+'</span>',
			'</li>'];
			break;
			case 'new_public_course_on_network':
			notification = ['<li class="unread" onclick="me(type,id)">',
			'<img src="/assets/group-avatar-mini.png" class="avatar-notifications avatar-mini">',
			'Nuevo curso <b>'+data.notificator.title+'</b> en tu red <b>'+data.owner.name+'</b><br/>',
			'<span class="time">'+jQuery.timeago(data.notification.created_at)+'</span>',
			'</li>'];
			break;
			case 'new_delivery_on_course':
			notification = ['<li class="unread" onclick="me(type,id)">',
			'<img src="/assets/group-avatar-mini.png" class="avatar-notifications avatar-mini">',
			'Nueva tarea <b>'+data.notificator.title+'</b> en tu curso <b>'+data.owner.title+'</b><br/>',
			'<span class="time">'+jQuery.timeago(data.notification.created_at)+'</span>',
			'</li>'];
			break;
			case 'new_survey_on_course':
			notification = ['<li class="unread" onclick="me(type,id)">',
			'<img src="/assets/group-avatar-mini.png" class="avatar-notifications avatar-mini">',
			'Nuevo curso <b>Ecuasiones de 2o Grado</b> en tu red <b>Cúrsame</b><br/>',
			'<span class="time">'+jQuery.timeago(data.notification.created_at)+'</span>',
			'</li>'];
			break;
			case 'new_survey_on_course':
			notification = ['<li class="unread" onclick="me(type,id)">',
			'<img src="/assets/group-avatar-mini.png" class="avatar-notifications avatar-mini">',
			'Nuevo curso <b>Ecuasiones de 2o Grado</b> en tu red <b>Cúrsame</b><br/>',
			'<span class="time">'+jQuery.timeago(data.notification.created_at)+'</span>',
			'</li>'];
			break;
			case 'user_comment_on_discussion':
			notification = ['<li class="unread" onclick="me(type,id)">',
			'<img src="/assets/group-avatar-mini.png" class="avatar-notifications avatar-mini">',
			'Nuevo curso <b>Ecuasiones de 2o Grado</b> en tu red <b>Cúrsame</b><br/>',
			'<span class="time">'+jQuery.timeago(data.notification.created_at)+'</span>',
			'</li>'];
			break;
			case 'user_comment_on_comment':
			notification = ['<li class="unread" onclick="me(type,id)">',
			'<img src="/assets/group-avatar-mini.png" class="avatar-notifications avatar-mini">',
			'<b>'+name+'</b> comentó en el tu comentario <br/>',
			'<span class="time">'+jQuery.timeago(data.notification.created_at)+'</span>',
			'</li>'];
			break;
			default :
			notification = ['<li class="unread" onclick="me(type,id)">',
			'<img src="/assets/group-avatar-mini.png" class="avatar-notifications avatar-mini">',
			'Nuevo curso <b>Ecuasiones de 2o Grado</b> en tu red <b>Cúrsame</b><br/>',
			'<span class="time">'+jQuery.timeago(data.notification.created_at)+'</span>',
			'</li>'];
			break;
		}
		$('#notifications_list').prepend(notification.join(''));
	});

	PrivatePub.subscribe ("/messages/notifications_user_"+Cursame.userId, function(data, channel){
		$('#messages-notifications-count span').html(1);
		var notification = ['<li class="unread" ">',
			'<img src="'+data.sender.avatar.modern.url+'" class="avatar-notifications avatar-mini">',
			'<b>'+data.sender.first_name+' '+data.sender.last_name+'</b><br/>'+data.message.mesage,
			'<br/><span class="time">'+jQuery.timeago(data.message.created_at)+'</span>',
			'</li>'];

		$('#messages-notifications-list').prepend(notification.join(''));
	});


});

