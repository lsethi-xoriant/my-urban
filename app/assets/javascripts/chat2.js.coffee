# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
    $('#send').click (e) ->
        e.preventDefault()
        $.ajax '/chat/pub',
            type: 'POST'
            data: {
                chat_data: {
                    message: $("input#message").val(),
                    reciever_id: $('meta[name=user-id]').attr("content"),
                    timestamp: $.now()
                }
            }
            error: (jqXHR, textStatus, errorThrown) ->
                console.log "Failed: " + textStatus 
            success: (data, textStatus, jqXHR) ->
                console.log "Success: " + jQuery.isPlainObject(data)