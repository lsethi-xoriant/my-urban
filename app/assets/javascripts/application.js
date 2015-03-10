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


$(document).ready(function() {

 $("input.filter_input").change(function(){
    $("input.filter_input").closest('form').submit();
  });

 $("input.filter_input").keydown(function(e){
        if (e.keyCode === 13) {
          $(this).closest('form').submit();
        }
  });

});


function inputDate(selected,evnt){
  $(".filter_date").val(selected);
  
}



