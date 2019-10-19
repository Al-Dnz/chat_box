App.chat_room = App.cable.subscriptions.create "ChatRoomChannel",
  connected: ->
    console.log("HOLLO FROM CHATROOM XX")
    $(document).on 'keypress', '#message-area' , (event) =>
        if event.keyCode is 13
          @speak(event.target.value)
          #$('#message-area').empty
          event.target.value= ""
          event.preventDefault()

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#posts_div').append(data.post)
    list = document.getElementById('posts_div')
    list.scrollTop = list.scrollHeight

  speak: (data) ->
    @perform 'speak', {message: data}
