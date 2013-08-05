
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
            

        }
        else{
          
        }

}

function DisableBlured(){
$('#timeline').foggy(false);
$('#box-user-credential').foggy(false);
$('#banner-profile').foggy(false);
$('#side-bar').foggy(false);
}