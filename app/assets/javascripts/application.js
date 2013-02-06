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
// require jquery
// require jquery_ujs
//= require_tree
//= require_raphael
//= requere_morris
//= require private_pub


// Adding and removing questions answers
function remove_fields(link) {
	$(link).prev("input[type=hidden]").val("1");
	$(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
	var new_id = new Date().getTime();
	var regexp = new RegExp("new_" + association, "g");
	$(link).parent().before(content.replace(regexp, new_id));
}

//notificaciones push usando private_pub
$(function() {
	PrivatePub.subscribe ("/notifications/"+Cursame.userId, function(data, channel){
		$('#notifications_count').html(data.num*1);
		console.log(data);
		var notification = "";
		switch(data.notification.kind){
			case 'user_comment_on_network':
				notification = ['<li>',
									'<img src="'+data.creator.avatar.modern.url+'" class="avatar-notifications avatar-mini">',
									'<b>'+data.creator.first_name+' '+data.creator.last_name+'</b> comentó en la red <b>'+data.owner.name+'</b><br/>',
										'<span class="time">'+jQuery.timeago(data.notification.created_at)+'</span>',
								'</li>'];
			break;
			case 'user_comment_on_discussion':
				notification = ['<li>',
									'<img src="/assets/group-avatar-mini.png" class="avatar-notifications avatar-mini">',
									'Nuevo curso <b>Ecuasiones de 2o Grado</b> en tu red <b>Cúrsame</b><br/>',
										'<span class="time">Hace 3 horas</span>',
								'</li>'];
			break;
			case 'new_public_course_on_network':
				notification = ['<li>',
									'<img src="/assets/group-avatar-mini.png" class="avatar-notifications avatar-mini">',
									'Nuevo curso <b>Ecuasiones de 2o Grado</b> en tu red <b>Cúrsame</b><br/>',
										'<span class="time">Hace 3 horas</span>',
								'</li>'];
			break;
			case 'new_survey_on_course':
				notification = ['<li>',
									'<img src="/assets/group-avatar-mini.png" class="avatar-notifications avatar-mini">',
									'Nuevo curso <b>Ecuasiones de 2o Grado</b> en tu red <b>Cúrsame</b><br/>',
										'<span class="time">Hace 3 horas</span>',
								'</li>'];
			break;
			default :
				notification = ['<li>',
									'<img src="/assets/group-avatar-mini.png" class="avatar-notifications avatar-mini">',
									'Nuevo curso <b>Ecuasiones de 2o Grado</b> en tu red <b>Cúrsame</b><br/>',
										'<span class="time">Hace 3 horas</span>',
								'</li>'];
			break;
		}
		$('#notifications_list').prepend(notification.join(''));
	});
});




