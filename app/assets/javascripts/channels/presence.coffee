App.presence = App.cable.subscriptions.create "PresenceChannel",
  connected: =>
    @get_in

  disconnected: =>
    @exit

  received: (data) =>
    if data.presence
      $('#'+data.token).remove()
      li = $ "<li>"
      li.html data.username
      li.attr 'id' , data.token
      li.attr 'class' , "connected-user"
      $('#connected-users-list').append(li)
    else
      $('#'+data.token).remove()

  get_in: ->
    @perform 'get_in'


  exit:  ->
    @perform 'unsubscribed'
