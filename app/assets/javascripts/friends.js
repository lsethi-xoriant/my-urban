$(document).ready(function(){

  //REQUEST
  //add friend from request
  $("body").on("click", "a.add_friend_link", function(){
    $(this).closest('.row').fadeOut();
    /*
    //$(this).removeClass('fr-add')
    $(this).removeClass('add_friend_link')
    $(this).addClass('active')
    $(this).text('Долучено')
    if ($(this).closest('.user-friends-container').data('target') == 2){
      $(this).closest('.medium-3').prev().fadeOut();
    } else if ($(this).closest('.user-friends-container').data('target') == 1){
      //$(this).closest('.medium-3').next().fadeOut();
    }
    */
   });

  //add follower from request
  $("body").on("click", "a.add_follower_link", function(){
    $(this).closest('.row').fadeOut();
    /*
    //$(this).removeClass('fr-add')
    $(this).removeClass('add_follower_link')
    $(this).removeClass('fr-remove')
    $(this).text('Відхилено')
    $(this).closest('.medium-3').next().fadeOut();
    */
   });

  //delete friend 
  $("body").on("click", "a.delete_friend", function(){
    $(this).closest('.row').fadeOut();
    /*
    //$(this).removeClass('fr-add')
    $(this).removeClass('delete_friend')
    $(this).removeClass('fr-remove')
    $(this).text('Видалено')
    //$(this).addClass('fr-add active')
    $(this).closest('.medium-3').next().fadeOut();
    */
   });

  $("body").on("click", "a.sidebar_add_friend", function(){
    $(this).closest('p').fadeOut();
    /*
    //$(this).removeClass('fr-add')
    $(this).removeClass('delete_friend')
    $(this).removeClass('fr-remove')
    $(this).text('Видалено')
    //$(this).addClass('fr-add active')
    $(this).closest('.medium-3').next().fadeOut();
    */
   });

  
});