//= require private_pub
//= require vendor/jquery-1.8.3
//= require vendor/jquery-ui-1.9.2
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require vendor/handlebars.runtime

//= require_tree .

// Adding and removing questions answers
function remove_fields(link, toId) {
  
  if(toId == '#box-question') {
    $(link).closest('.question-field').remove();
    changeNumbers('#box-question', '#question-num');
  } else if( toId =='#box-request' ) {
    var grandfather = $(link).parent().parent().parent();
    $(link).parent().parent().remove();
    changeNumbers(grandfather, '#request-num');
  }
}


function add_fields(link, association, content, toId) {

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

  if ( idFind == '#question-num' ) {
    $.each($(idParent).children(), function(index, value) {
      $(value).find('#question-num').html(count+1+'. ');
      count ++;
    });

  } else if( idFind =='#request-num' ){
    $.each(idParent.children(), function(index, value) {
      $(value).find('#request-num').html(alphabet[count]+') ');
      count ++;
    });
  }

  var count = 0;
};

var Sounds = {
  sounds: {
    "newMessage": "new-message-sound",
    "newNotification": "new-notification-sound"
  },
  play: function( id ) {
    var sound = document.getElementById( Sounds.sounds[id] );
    sound.play();
  }
};

function truncate(text, maxLength, ellipseText){
  ellipseText = ellipseText || '&hellip;';

  if (text.length < maxLength) 
    return text;

  //Find the last piece of string that contain a series of not A-Za-z0-9_ followed by A-Za-z0-9_ starting from maxLength
  var m = text.substr(0, maxLength).match(/([^A-Za-z0-9_]*)[A-Za-z0-9_]*$/);
  if(!m) return ellipseText;
  
  //Position of last output character
  var lastCharPosition = maxLength-m[0].length;
  
  //If it is a space or "[" or "(" or "{" then stop one before. 
  if(/[\s\(\[\{]/.test(text[lastCharPosition])) lastCharPosition--;
  
  //Make sure we do not just return a letter..
  return (lastCharPosition ? text.substr(0, lastCharPosition+1) : '') + ellipseText;
};

window.Notice = function(type, message)  {
  var notice        = $('#notice'),
      noticeWrapper = notice.closest('#noticce');

  noticeWrapper.addClass('active');
  notice.removeClass('error success').addClass( type ).html( message );

  setTimeout(function() {
    noticeWrapper.removeClass('active');
  }, 3100);
};

// notificaciones push usando private_pub
$(function() {

  if ( typeof Cursame != 'undefined' ) {
    Chat.recoverConversations( Cursame.userId );
  };

  // data.sender.id = data.reciver.id return
	// Se suscribe al canal para las notificaciones del chat
  if (typeof Cursame === 'undefined') {
    return;
  };

	PrivatePub.subscribe ("/messages/notifications_user_" + Cursame.userId, function(data, channel) {

    if ( data.sender.id == Cursame.userId ){
          alert("notificación del mismo usuario" );
          return;
    } else {
     var url, notification, numNotifications;
     var channelType = data.channel.channel_name.split('course_channel_');
     url = channelType[1] ? '/home/open_channel/' + channelType[1] + '?course=true' : '/home/open_channel/' + data.sender.id;    
     if (data.sender.avatar.modern.url != null){
        var avatar_modern = data.sender.avatar.modern.url;
       
        $.get(data.sender.avatar.modern.url)
         .done(function() { 
          avatar_modern;
         }).fail(function() { 
         var avatar_modern = "/assets/imagexxx.png";
        });

     } else {
        var avatar_modern = "/assets/imagexxx.png";
     };
         
      notification = [
          '<li class="unread">',
          '<div class="activity-feed">',
          '<a title="Conversar" href="' + url + '" data-remote="true">',
          '<div class="activity-feed-author">',
          '<img src="' + avatar_modern + '" class="avatar avatar-45"></div>',
          '<div class="activity-feed-main">',
          '<span class="as-link">' + data.sender.first_name+' '+ data.sender.last_name + '</span>',
          '<p>' + truncate(data.message.mesage, 88, "...") +'</p>',
          '<span class="meta">' + jQuery.timeago(data.message.created_at) + '</span></div></a></div></li>'
      ];
      
      Sounds.play("newMessage");

  		//si ya existe la conversacion no se crea la notificación
  		if( $('#chat-channel-'+data.channel.id).length ) {
  		  var panel = $("#chat-channel-" + data.channel.id);
  	    var chatZonePosition = $(panel).css('bottom');

        // aqui agrego un asterisco a la ventanita
        // cuando esta collapsada, asi sabe cuando el usario tiene un msj pendiente esa ventana
        if (chatZonePosition.replace('px', '') < 200) {
            $("#chat-channel-" + data.channel.id + "span").append('*');
        };
  		} else {
  			numNotifications = $('#messages-notifications-count').html() * 1;
  			$('#messages-notifications-count').html(numNotifications + 1);
        $('#messages-notifications-count').show();
  			$('#messages-notifications-list').prepend(notification.join(''));
  		};
    };
  });
    
  PrivatePub.subscribe("/messages/chat_notifications", function(data, channel) {
    if ( data && data.online ) {
      $('#chat-list-user-' + data.userId).removeClass('user-offline').addClass('user-online');
    } else {
      $('#chat-list-user-' + data.userId).removeClass('user-online').addClass('user-offline');
    };
  });

  // Open commentable area in publications
  $('.new-comment-trigger').live('click', function() {
    commentHolder = $(this).closest('.add-comment');

    commentHolder.addClass("active");
    commentHolder.find('.new-comment-actions').show();
    commentHolder.find('.comment-author').show();

    if ( $('div.overlay').length ) {
      overlayPositioning( $('div.overlay') );
    };
  });

  $(document).ajaxStart( function(event) {
    $('#log_loadding').show();
    $('.activable').attr("disabled", true);
  }).ajaxStop( function() {
    $('#log_loadding').hide();
    $('.activable').attr("disabled", false);
    $('.autogrow').autosize();
  });

  // Scroll top
  $(window).scroll(function(){
    if ($(this).scrollTop() > 100) {
      $('#scrollup').fadeIn();
    } else {
      $('#scrollup').fadeOut();
    };
  });

  $('#scrollup').click(function() {
    $('html,body').animate({ scrollTop: 0 }, '1500', 'swing');
  });

  $('.edit-publication-link').live('click', function() {
    $(this).closest('.publication-box').find('.form_for_edit_wall').slideToggle(300);
  });

  $('.cancel-edit-publication').live('click', function(event) {
    event.preventDefault();
    $(this).closest('.form_for_edit_wall').slideUp(300);
  });
});

