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

	$( "#datepicker" ).datepicker({dateFormat: 'dd-mm-yy', onSelect: inputDate});

	$('.city-dr-dwn > a').hover(function(){
		$('.city-dr-dwn-cont-wr').slideDown(300);
	},function(){
		// $('.city-dr-dwn-cont-wr').fadeOut(200);
	
		$('.city-dr-dwn-cont-wr').hover(function(){

		},function(){
			$('.city-dr-dwn-cont-wr').fadeOut(200);
		});

	});

	$('.field_with_errors input').focus(function(){
		$(this).parents('.field_with_errors').removeClass('field_with_errors');
	});

});
