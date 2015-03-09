jQuery(document).ready(function() {
	
	$('.welcome-div .btn-1').click(function(){
		$('.home-content-wrapper').addClass('chose-region');
	});

	$('.upload-img input').change(function(){
		var _src = $('.upload-img input').val();

		if (_src == ""){
			console.log(_src);
			$('.upload-img').css('background-image','url(/assets/i-m-m.png)');

		} else {
			console.log(_src);
			$('.upload-img').css('background-image', 'url(' + _src + ')');
		}
	});

	$( "#datepicker" ).datepicker({ onSelect: inputDate});

});