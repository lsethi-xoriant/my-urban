 jQuery(document).ready(function() {
  //var inputLocalFont = $(".pictures")//document.getElementById("pictures_");
  //inputLocalFont.addEventListener("change",previewImages,false);
  var count = 1;
  $('body').on("change",".picturesPre",previewImages);

  function previewImages(){
    var fileList = this.files;

    $('input.picturesPre').removeClass('hide');
    $('input.picturesPre').addClass('hide');
    
    var anyWindow = window.URL || window.webkitURL;

    for(var i = 0; i < fileList.length; i++){
       var objectUrl = anyWindow.createObjectURL(fileList[i]);
       $('.preview-area').append('<img src="' + objectUrl + '" class="picturesPre pictures'+ count + '" />');
       window.URL.revokeObjectURL(fileList[i]);  
    }

    $('.preview-area').append('<a href="javascript:void(0)" rel="nofollow" class="picturesPre pictures'+ count +'">X</a>')
    count = count + 1;
    addInput(count);
  }

  function addInput(countImage){
    $('.edit_event').prepend('<input class="pictures' + countImage + ' picturesPre" id="pictures_" multiple="multiple" name="pictures[]" type="file">');
  }


  $('body').on("click","a.picturesPre",deleteImages);

  function deleteImages(){
    var im_cl = $(this).attr('class');
    im_cl = im_cl.split(' ');
    im_cl = im_cl[1];
    $('img.' + im_cl).remove();
    $(this).remove();
    $('input.' + im_cl).remove();
  }

});