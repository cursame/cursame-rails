
// Adding and removing questions answers
function remove_fields(link, toId) {
  if(toId == '#box-question') {

    var questions =0;
    var question_fields = $(link).closest('.box-question').children('.question-field')
    $.each($(question_fields), function(index, val) {
      if ($(val).find('input._destroy').val() == 'false') {
        questions++;
      }
    });

    if ( questions > 1 ) {
      $(link).closest('.question-field').find('input._destroy').val(1);
      $(link).closest('.question-field').hide();
      var grandfather = $(link).parent().parent().parent().parent().parent();
      changeNumbers(grandfather, '#question-num');
    } else {
      Notice('error', 'Los custionarios deben de tener como minimo una pregunta.')
    };

  } else if( toId =='#box-request' ) {

    var grandfather = $(link).parent().parent().parent();
    $(link).parent().find('input._destroy').val(1);
    $(link).parent().parent().hide();
    changeNumbers(grandfather, '#request-num');

  };
};

function add_fields(link, association, content, toId, id) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");

  if ( toId =='#box-question' ) {
    $(toId+'-'+id).append(content.replace(regexp, new_id));
    changeNumbers('#box-question-'+id, '#question-num');
  } else if ( toId =='#box-request' ) {
    $(link).parent().parent().find('#box-request-'+id).append(content.replace(regexp, new_id));
    changeNumbers($(link).parent().parent().find('#box-request-'+id), '#request-num');
  };
};

function add_course_evaluation_fields(link, association, content) {
  var new_id = new Date().getTime(),
      regexp = new RegExp("new_" + association, "g"),
      table = $(link).closest('.course-evaluation-schema-list').find('.table-schema tbody');

  table.append(content.replace(regexp, new_id));
};


// Agregar y Borrar campos a Evaluation Criteria
function add_evaluation_criteria_fields(link, association, content) {
  var new_id = new Date().getTime(),
      regexp = new RegExp("new_" + association, "g"),
      fieldsContainer = $(link).closest('div.fields-wrap').find('div.fields-group');

  fieldsContainer.append(content.replace(regexp, new_id));
};

function remove_evaluation_criteria_field(link) {
  var $link = $(link);

  $link.siblings('input._destroy').val(1);
  $link.closest('div.field-item').hide();
};

function changeNumbers(idParent, idFind){
  var count = 0 ;
  var alphabet= new Array('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z');

  if ( idFind == '#question-num' ) {
    $.each($(idParent).find('.question-field'), function(index, value) {
      if ($(value).find('input._destroy').val() == 'false') {
        $(value).find('#question-num').html(count+1+'. ');
        count ++;
      }
    });
  } else if( idFind =='#request-num' ){
    if ( idParent.find('#request-num').length > 1 ){
      $.each(idParent.find('#request-num'), function(index, value) {
        if ( $(value).parent().find('input._destroy').val() == 'false' ) {
          $(value).html(alphabet[count]+') ');
          count ++;
        }
      });
    }else{
      $.each(idParent.children(), function(index, value) {
        if ( $(value).find('#request-num').parent().find('input._destroy').val() == 'false' ) {
          $(value).find('#request-num').html(alphabet[count]+') ');
          count ++;
        };
      });
    }
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


function getChildrensHeight(obj) {
  var holder = obj.parent(),
      childrens = holder.children(),
      totalHeight = 0;

  $.each(childrens, function(index, val) {
    totalHeight += $(val).outerHeight();
  });

  return totalHeight;
}

function scrollToBottom(obj) {
  var h = getChildrensHeight(obj),
      parent = obj.parent();

  parent.scrollTop( h );

  if ( parent.hasClass('scrollbar') ) {
    parent.perfectScrollbar('update');
  };
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

  noticeWrapper.animate({
    top: 0
  }, 100);

  notice.removeClass('error success notice').addClass( type ).html( message );

  setTimeout(function() {
    noticeWrapper.animate({
      top: notice.outerHeight() * -1
    }, 100);
  }, 4000);
};

$(function() {

  // Toggle .active class
  $('.toggle-label-js').live('click', function(event) {
    $(this).closest('label').toggleClass('active');
  });

  $('form.form-validate-js').validate();

  $(".date-picker" ).datepicker({
    inline: true,
    minDate: 0,
    showOtherMonths: true,
    dateFormat: 'dd/mm/yy',
    monthNames: [I18n.t("date.month.jan"),
                 I18n.t("date.month.feb"),
                 I18n.t("date.month.mar"),
                 I18n.t("date.month.apr"),
                 I18n.t("date.month.may"),
                 I18n.t("date.month.jun"),
                 I18n.t("date.month.jul"),
                 I18n.t("date.month.aug"),
                 I18n.t("date.month.sept"),
                 I18n.t("date.month.oct"),
                 I18n.t("date.month.nov"),
                 I18n.t("date.month.dec")],
    dayNamesMin: [I18n.t("date.day.sun"),
                  I18n.t("date.day.mon"),
                  I18n.t("date.day.tu"),
                  I18n.t("date.day.we"),
                  I18n.t("date.day.th"),
                  I18n.t("date.day.fri"),
                  I18n.t("date.day.sat")]
  });

  $(".datetime-picker").live('focus', function(event) {
    $(this).datetimepicker({
      inline: false,
      minDate: 0,
      hourMin: 0,
      hourMax: 23,
      controlType: 'select',
      showOtherMonths: true,
      dateFormat: 'dd/mm/yy',
      monthNames: [I18n.t("date.month.jan"),
                 I18n.t("date.month.feb"),
                 I18n.t("date.month.mar"),
                 I18n.t("date.month.apr"),
                 I18n.t("date.month.may"),
                 I18n.t("date.month.jun"),
                 I18n.t("date.month.jul"),
                 I18n.t("date.month.aug"),
                 I18n.t("date.month.sept"),
                 I18n.t("date.month.oct"),
                 I18n.t("date.month.nov"),
                 I18n.t("date.month.dec")],
      dayNamesMin: [I18n.t("date.day.sun"),
                  I18n.t("date.day.mon"),
                  I18n.t("date.day.tu"),
                  I18n.t("date.day.we"),
                  I18n.t("date.day.th"),
                  I18n.t("date.day.fri"),
                  I18n.t("date.day.sat")],
      beforeShow: function(input, inst) {
        var cal = inst.dpDiv;
        var top  = $(this).offset().top + $(this).outerHeight();
        var left = $(this).offset().left;
        setTimeout(function() {
          cal.css({
              'top' : top,
              'left': left
          });
        }, 10);
      }
    });
  });

  $(document).keyup(function(e) {
    if (e.keyCode == 27) {
      removeModal();
    }
  });

  // Redirect Select Dropdown
  $('.select-redirect').change(function(event) {
    event.preventDefault();
    window.location = this.value;
  });

  $('.page-sub-navigation a').click(function(event) {
    var $this = $(this),
        remote = $this.data('remote');

    if (remote) {
      $this.closest('ul').find('a').removeClass('active');
      $this.addClass('active');
    };
  });

  // Soporte para inputs dentro de labels Firefox
  if($.browser.mozilla) {
    $(document).on('click', 'label.btn.ff', function(e) {
      if (e.target.nodeName == 'INPUT') return;
      var input = $(this).find('.tobe-t');
      input[0].click();
    });
  }

  $('.autogrow').expanding();

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
  $('.new-comment-trigger').live('focus', function() {
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
    $('.scrollbar').perfectScrollbar();
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

  // Cancelar Editar Wall Publication
  $('.cancel-edit-publication-js').live('click', function(event) {
    event.preventDefault();
    $(this).closest('.post-box-edit').slideUp(300);
  });

  $(".swift-enter").live('keydown', function(e) {
    if (e.keyCode == 13) {
      if ( ! e.shiftKey ) {
        $(this).closest('form').submit();
        e.preventDefault();
        $(this).val('').change();
      }
    }
  });

  Spinners.create('.spinner-dark', {
    width: 2,
    height: 5,
    color: '#000000'
  }).play();
});


window.paginateWorking = false;

function PaginateINwall(url_paginate, page, total_page, other_params){
  if ( !paginateWorking ) {
    window.paginateWorking = true;
    if ((page*1) != (total_page*1) && (total_page*1) != 1){
        $("#paginate_wall").html("<div id='pageless-loader' style='opacity: 1;'><img src='/assets/load.gif'/></div>");
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

