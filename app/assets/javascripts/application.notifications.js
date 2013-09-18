$(function(){
	$('#notifications_count').on('click',function(e){
		e.preventDefault();
		$("#box-messages-notifications").hide();
		$('#box-notifications').toggle();		
	});

	$("#messages-notifications-count").click(function(e) {
		e.preventDefault();
		$("#box-notifications").hide();
		$("#box-messages-notifications").toggle();
	});
	    //mostrar online
	    $("#toggle-chat").click(function () {
	    	var usersOnlinePanelPosition = $('#users-and-groups-for-chat').css('bottom');

	    	if(usersOnlinePanelPosition.replace('px','') < 200){
	    		$('#users-and-groups-for-chat').css('bottom','312px');
	    	}
	    	else{
	    		$('#users-and-groups-for-chat').css('bottom','1px');
	    	}
	    	$("#users-and-groups-online").toggle();	    	
	    });

	});

