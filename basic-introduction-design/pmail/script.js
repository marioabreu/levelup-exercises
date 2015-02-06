$(document).ready(function() {     
    $('#user-logo').on('mouseover', function(){ 
      $('.user-wrapper .menu').show();    
    });

    $(document).on('click', function() {
      $('.user-wrapper .menu').hide();
    });
}); 
