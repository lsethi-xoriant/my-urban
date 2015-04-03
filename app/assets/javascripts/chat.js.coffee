# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
    source = new EventSource('/chat/sub')
    source.addEventListener 'chat_event', (e) ->
        console.log('h' + e.data)
    $('#send').click (e) ->
        e.preventDefault()
        $.ajax '/chat/pub',
            type: 'POST'
            data: {
                chat_data: {
                    message: $("input#message").val(),
                    timestamp: $.now()
                }
            }
            error: (jqXHR, textStatus, errorThrown) ->
                console.log "Failed: " + textStatus 
            success: (data, textStatus, jqXHR) ->
                console.log "Success: " + jQuery.isPlainObject(data)