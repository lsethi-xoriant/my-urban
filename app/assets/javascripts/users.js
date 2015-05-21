$(document).ready(function(){
  
  $("body").on("change", "#background_upload", function(){
    $(".user-backgr").spin({
      top: '30%'
    });
    $(this).closest('form').submit();
   });

});