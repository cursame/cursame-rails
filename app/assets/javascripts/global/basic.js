
// Adding and removing questions answers
function remove_fields(link, toId) {
  if(toId == '#box-question') {
    $(link).closest('.question-field').remove();
    changeNumbers('#box-question', '#question-num');
  } else if( toId =='#box-request' ) {
    var grandfather = $(link).parent().parent().parent();
    $(link).parent().parent().remove();
    changeNumbers(grandfather, '#request-num');
  };
};

function add_fields(link, association, content, toId) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");

  if ( toId =='#box-question' ) {
    $(toId).append(content.replace(regexp, new_id));
    changeNumbers('#box-question', '#question-num');
  } else if ( toId =='#box-request' ) {
    $(link).parent().parent().find('#box-request').append(content.replace(regexp, new_id));
    changeNumbers($(link).parent().parent().find('#box-request'), '#request-num');
  };
};

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
  };

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

  var m = text.substr(0, maxLength).match(/([^A-Za-z0-9_]*)[A-Za-z0-9_]*$/);
  if(!m) return ellipseText;
  
  var lastCharPosition = maxLength-m[0].length;
  if(/[\s\(\[\{]/.test(text[lastCharPosition])) lastCharPosition--;  
  return (lastCharPosition ? text.substr(0, lastCharPosition+1) : '') + ellipseText;
};

//Reset Form
function resetForm(objForm){
  objForm[0].reset();

  //removing assets
  $.each($(objForm).find('.file-master-input-box').children(), function(index, value) {
    if ( !$(value).is(":visible") ) {
      $(value).remove();
    }
  });
  $(objForm).find('.upload-label').empty().hide();
};

function mask(idOrCls,msj) {
  $('<div class="ui-widget-overlay" id="mask"><span>'+msj+'</span></div>').appendTo(idOrCls);
  $('#mask').show();
};

function scrollToBottom(obj) {
  var holder = obj.parent(),
      childrens = holder.children(),
      totalHeight = 0;
  $.each(childrens, function(index, val) {
    totalHeight += $(val).outerHeight();
  });
  holder.scrollTop(totalHeight);
}

function unmask(idOrCls) {
  $('#mask').hide();
};

// Modal
function modal(element){
  $('<div class="ui-widget-overlay" id="overlaymask"></div>').appendTo('body');
  $('<div id="cursame-modal"></div>').appendTo('body');
  $(element).appendTo('#cursame-modal');

  var contenedor = $('#cursame-modal');

  contenedor.css({
    top:$(window).height()/2,
    left:($(window).width()- $(element).width())/2
  });

  $('#overlaymask').show();
};


function unmodal(){
    $('#overlaymask').remove();
    $('#cursame-modal').remove();
}

window.Notice = function(type, message)  {
  var notice        = $('#notice'),
      noticeWrapper = notice.closest('#noticce');

  noticeWrapper.addClass('active');
  notice.removeClass('error success').addClass( type ).html( message );

  setTimeout(function() {
    noticeWrapper.removeClass('active');
  }, 3100);
};

$(function() {

  // Soporte para inputs dentro de labels Firefox
  if($.browser.mozilla) {
    $(document).on('click', 'label.btn.ff', function(e) {
      if (e.target.nodeName == 'INPUT') return;
      var input = $(this).find('.tobe-t');
      input[0].click();
    });
  }

  // Textareas Autogrow
  $('.autogrow').autosize();
   
   $(window).scroll(function() {
     if ( $(window).scrollTop() + $(window).height() == $(document).height() ) {
      if ( $("#paginate_wall" ).length == 1 ) {
         $("#paginate_wall").trigger("click");
      };
     };
   });

   $('.scrollbar').perfectScrollbar();

  if ( typeof Cursame != 'undefined' ) {
    Chat.recoverConversations( Cursame.userId );
  };

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
          '<li class="unread" id="li_channel_' + data.channel.id + '">',
          '<div class="activity-feed">',
          '<a title="Conversar" href="' + url + '" data-remote="true">',
          '<div class="activity-feed-author">',
          '<img src="' + avatar_modern + '" class="avatar avatar-45"></div>',
          '<div class="activity-feed-main">',
          '<span class="as-link">' + data.sender.first_name+' '+ data.sender.last_name + '</span>',
          '<p>' + truncate(data.message.mesage, 88, "...") +'</p>',
          '<span class="meta">' + jQuery.timeago(data.message.created_at) + '</span></div></a></div></li>'
      ];

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
      }
      
      $('#li_channel_' + data.channel.id).replaceWith(notification.join(''));
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

  /* Add active class tu subnav links*/
  $('.section-subnav li > a').on('click', function() {
    var $this = $(this),
        nav   = $this.closest('.section-subnav');

    nav.children('li').removeClass('active');
    $this.parent().addClass('active');
  });

  $('.search-courses').on('submit', function() {
    $('.section-subnav li').removeClass('active');
  });

  $('.edit-publication-link').live('click', function() {
    $(this).closest('.publication-box').find('.form_for_edit_wall').slideToggle(300);
  });

  $('.cancel-edit-publication').live('click', function(event) {
    event.preventDefault();
    $(this).closest('.form_for_edit_wall').slideUp(300);
  });
});

window.paginateWorking = false;

function PaginateINwall(url_paginate, page, total_page, other_params){
  if ( !paginateWorking ) {
    window.paginateWorking = true;
    if ((page*1) != (total_page*1) && (total_page*1) != 1){
        $("#paginate_wall").html("<div id='pageless-loader'><img src='/assets/load.gif'/></div>");
        $.get( url_paginate+"?page="+page+"&fo_format=remote"+other_params , function( data ) {
          $('#paginate_wall').html('');
          window.paginateWorking = false;
        });
        $("#paginate_wall").attr("onclick","PaginateINwall("+"'"+url_paginate+"'"+","+(page*1+1)+", "+total_page+","+"'"+other_params+"'"+")");
     }else{
        $.get( url_paginate+"?page="+page+"&fo_format=remote"+other_params , function( data ) {
          window.paginateWorking = false;
        });
        $("#paginate_wall").attr("onclick","");
        $("#paginate_wall").html("<div class='no-more-publicaitons-message'><h5>No hay más publicaciones por cargar.</h5></div>");
    }
  };
}   
