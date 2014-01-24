   function ValidateMemberInCourse(aclass, member,type_update, member_it ){
   		var checked = $('.'+aclass).attr('checked');
    	var url = "/update_mc?checked="+checked+"&id_member="+member+"&type_update="+type_update+'&member_it='+member_it
   		$.get( url, function( data ) {
       		 $( ".result" ).html( data );
        });
    };
  