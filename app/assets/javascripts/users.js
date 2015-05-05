$(document).ready(function(){
  
  $("body").on("change", "#background_upload", function(){
    $(this).closest('form').submit();
   });

  $(".background_user").hover(function(){
    console.log('hello')
  }, function(){
    console.log('nie');
  })
});