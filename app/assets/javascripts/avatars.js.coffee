jQuery ->
  new CarrierWaveCropper()

class CarrierWaveCropper
  constructor: ->
    $('#avatar_avatar_cropbox ').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 200, 200]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#avatar_avatar_crop_x').val(coords.x)
    $('#avatar_avatar_crop_y').val(coords.y)
    $('#avatar_avatar_crop_w').val(coords.w)
    $('#avatar_avatar_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#avatar_avatar_previewbox').css
      width: Math.round(100/coords.w * $('#avatar_avatar_cropbox').width()) + 'px'
      height: Math.round(100/coords.h * $('#avatar_avatar_cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'
