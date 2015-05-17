$(document).ready(function(){
  
  $("body").on("change", "#background_upload", function(){
    $(this).closest('form').submit();
   });

});