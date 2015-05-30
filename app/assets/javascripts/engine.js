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
	//$( "#datepicker" ).datepicker(  );

	$('.city-dr-dwn > a').hover(function(){
		$('.city-dr-dwn-cont-wr').slideDown(300);
	},function(){
		// $('.city-dr-dwn-cont-wr').fadeOut(200);
	
		$('.city-dr-dwn-cont-wr').hover(function(){

		},function(){
			$('.city-dr-dwn-cont-wr').fadeOut(200);
		});

	});

	$('.field_with_errors input').keydown(function(){
		$(this).parents('.field_with_errors').removeClass('field_with_errors');
	});

	$('.friends-tabs a').click(function(){
		var _index = $(this).data('label');
		var _tabContentItem = $('.friends-tabs-content').find('[data-target="' + _index + '"]');
		$('.friends-tabs a').removeClass('active');
		$(this).addClass('active');
		$('.user-friends-container').slideUp(0);
		_tabContentItem.slideDown();


	});


// var inputLocalFont = document.getElementById("pictures_");
// inputLocalFont.addEventListener("change",previewImages,false);

// function previewImages(){
// 	var fileList = this.files;

// 	var anyWindow = window.URL || window.webkitURL;

// 	for(var i = 0; i < fileList.length; i++){
// 		var objectUrl = anyWindow.createObjectURL(fileList[i]);
// 		$('.preview-area').append('<img src="' + objectUrl + '" />');
// 		window.URL.revokeObjectURL(fileList[i]);
// 	}
// }



});
