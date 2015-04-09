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
//= require foundation.min
//= require jquery.infinitescroll
//= require underscore
//= require gmaps/google
//= require jquery
//= require jquery.jcrop
//= require jquery.remotipart
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
    }
  })
})



function inputDate(selected,evnt){
  $(".filter_date").val(selected);
  $("input.filter_date").closest('form').submit();
}

// AVATAR&& EVENT_IMAGE
$(document).ready(function(){
  $("body").on("change", "#avatar_avatar", function(){
    $(this).closest('form').submit();
   });
});


var placeSearch, autocomplete;
var componentForm = {
  street_number: 'short_name',
  route: 'long_name',
  locality: 'long_name',
  administrative_area_level_1: 'short_name',
  country: 'long_name',
  postal_code: 'short_name'
};

function initialize() {
  $('#autocomplete').val('');
  // Create the autocomplete object, restricting the search
  // to geographical location types.
  $(window).keydown(function(event){

    if(event.keyCode == 13) {
      event.preventDefault();
      return false;
    }
  });
  autocomplete = new google.maps.places.Autocomplete(
      /** @type {HTMLInputElement} */(document.getElementById('autocomplete')),
      { types: ['geocode'] });
  // When the user selects an address from the dropdown,
  // populate the address fields in the form.
  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    fillInAddress();
  });
}

function fillInAddress() {
  // Get the place details from the autocomplete object.
  var place = autocomplete.getPlace();

  for (var component in componentForm) {
    document.getElementById(component).value = '';
    document.getElementById(component).disabled = false;
  }

  // Get each component of the address from the place details
  // and fill the corresponding field on the form.
  for (var i = 0; i < place.address_components.length; i++) {
    var addressType = place.address_components[i].types[0];
    if (componentForm[addressType]) {
      var val = place.address_components[i][componentForm[addressType]];
      document.getElementById(addressType).value = val;
    }
  }
}

// Bias the autocomplete object to the user's geographical location,
// as supplied by the browser's 'navigator.geolocation' object.
function geolocate() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var geolocation = new google.maps.LatLng(
          position.coords.latitude, position.coords.longitude);
      var circle = new google.maps.Circle({
        center: geolocation,
        radius: position.coords.accuracy
      });
      autocomplete.setBounds(circle.getBounds());
    });
  }
}







