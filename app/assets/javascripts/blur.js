
function HashBlured(){
    var flucted = $('#').hasClass('message-form-btn');

        if (flucted = true){

            $('#timeline').foggy({
              blurRadius: 2,          // In pixels.
              opacity: 0.2,           // Falls back to a filter for IE.
              cssFilterSupport: true  // Use "-webkit-filter" where available.
            });
            
            $('#box-user-credential').foggy({
              blurRadius: 2,          // In pixels.
              opacity: 0.2,           // Falls back to a filter for IE.
              cssFilterSupport: true  // Use "-webkit-filter" where available.
            });
            
            $('#banner-profile').foggy({
              blurRadius: 5,          // In pixels.
              opacity: 0.2,           // Falls back to a filter for IE.
              cssFilterSupport: true  // Use "-webkit-filter" where available.
            });
            
            $('#side-bar').foggy({
              blurRadius: 5,          // In pixels.
              opacity: 0.2,           // Falls back to a filter for IE.
              cssFilterSupport: true  // Use "-webkit-filter" where available.
            });
            
            $('.container').css({'background':'#f7f7f7'});
            $('body').css({'background':'#f7f7f7'});
        }
        else{
          
        }

}

function DisableBlured(){
$('#timeline').foggy(false);
$('#box-user-credential').foggy(false);
$('#banner-profile').foggy(false);
$('#side-bar').foggy(false);
$('.container').css({'background':'#fff'});
$('body').css({'background':'#fff'});
}

function CancelEditingBlur(){
     $('.non-blur').foggy(false);
     $('.public-blur').foggy(false);
     $('#side-bar').foggy(false);
     $('#banner-profile').foggy(false);
     $('#box-user-credential').foggy(false);
     $('.blured-i').foggy(false);
     $('#timeline').foggy(false);
     $('.container').css({'background':'#fff'});
     $('body').css({'background':'#fff'});
     
     
}

function CleanerBlur(){
     $('.non-blur').foggy(false);
     $('.public-blur').foggy(false);
     $('#side-bar').foggy(false);
     $('#banner-profile').foggy(false);
     $('#box-user-credential').foggy(false);
     $('.blured-i').foggy(false);
     $('#timeline').foggy(false);
     $('.container').css({'background':'#fff'});
     $('body').foggy(false);
     $('body').css({'background':'#fff'});
    
}

function EditingBlur(){
    
    CancelEditingBlur();
    CleanerBlur();
    
    $('.blured-i').foggy({
      blurRadius: 1,          // In pixels.
      opacity: 0.3,           // Falls back to a filter for IE.
      cssFilterSupport: true  // Use "-webkit-filter" where available.
    });
    
    $('#box-user-credential').foggy({
      blurRadius: 1,          // In pixels.
      opacity: 0.3,           // Falls back to a filter for IE.
      cssFilterSupport: true  // Use "-webkit-filter" where available.
    });
    
    $('#banner-profile').foggy({
      blurRadius: 1,          // In pixels.
      opacity: 0.3,           // Falls back to a filter for IE.
      cssFilterSupport: true  // Use "-webkit-filter" where available.
    });
    
    $('#side-bar').foggy({
      blurRadius: 1,          // In pixels.
      opacity: 0.3,           // Falls back to a filter for IE.
      cssFilterSupport: true  // Use "-webkit-filter" where available.
    });
    
    $('.public-blur').foggy({
      blurRadius: 1,          // In pixels.
      opacity: 0.3,           // Falls back to a filter for IE.
      cssFilterSupport: true  // Use "-webkit-filter" where available.
    });
    
    $('.non-blur').foggy(false);
    $('.container').css({'background':'#f7f7f7'});
    $('body').css({'background':'#f7f7f7'});
   
}

function CancelEditingBlur(){
     $('.non-blur').foggy(false);
     $('.public-blur').foggy(false);
     $('#side-bar').foggy(false);
     $('#banner-profile').foggy(false);
     $('#box-user-credential').foggy(false);
     $('.blured-i').foggy(false);
     $('#timeline').foggy(false);
     $('.container').css({'background':'#fff'});
     $('body').css({'background':'#fff'});
     
     
}

function CleanerBlur(){
     $('.non-blur').foggy(false);
     $('.public-blur').foggy(false);
     $('#side-bar').foggy(false);
     $('#banner-profile').foggy(false);
     $('#box-user-credential').foggy(false);
     $('.blured-i').foggy(false);
     $('#timeline').foggy(false);
     $('.container').css({'background':'#fff'});
     $('body').foggy(false);
     $('body').css({'background':'#fff'});
    
}