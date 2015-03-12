// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.mousewheel.min
//= require raphael-min
//= require jquery.mapael
//= require ukraine
//= require map
//= require jquery.turbolinks
//= require turbolinks
//= require jquery.infinitescroll
//= require_tree .


  function getAutoCompleteCities() {
    $.get('/autocomplete.js', function( data ) {
      clients = JSON.parse(data);
      $('input#user_city').autocomplete({ 
        source: clients 
      })
    })
  }


$(document).ready(function(){
  $('input#user_city').keydown(function(){
    getAutoCompleteCities();
  })
});

$(document).ready(function(){
  $("body").on("keyup", "input.ajax_send", function(){
    $(this).closest('form').submit();
   });
});

$(document).ready(function() {
  if ($('.pagination').length) {
    $(window).scroll(function() {
      var url = $('.pagination .next_page').attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $('.pagination').text("Please Wait...");
        return $.getScript(url);
      }
    });
    return $(window).scroll();
  }

});

//filter ajax sending
$(document).ready(function() {

 $("select.filter_select").change(function(){
    $(this).closest('form').submit();
  });

 $("input.filter_input").keydown(function(e){
        if (e.keyCode === 13) {
          $(this).closest('form').submit();
        }
  });

 $("body").on("click", ".ui-autocomplete li", function(){
  $("input.filter_date").closest('form').submit();
 });

 $("body").on("click", ".filter_radio", function(){
  $("input.filter_date").closest('form').submit();
 });


});


$(document).ready(function(){
  $(".user_for_invite").click(function(){
    //alert($(this).hasClass('invited'));
    if ($(this).closest('.invite-fr-list-item').hasClass('invited')){
      $(this).closest('.invite-fr-list-item').removeClass('invited');
      $(this).closest('.invite-fr-list-item').children().last().prop("checked", false);
    }
    else{
      $(this).closest('.invite-fr-list-item').addClass('invited');
      $(this).closest('.invite-fr-list-item').children().last().prop("checked", true);

      //$(this '#invetes_')
    }
    //$(this).addClass("invited");
  })
})


function inputDate(selected,evnt){
  $(".filter_date").val(selected);
  $("input.filter_date").closest('form').submit();
}



