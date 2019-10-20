App.presence = App.cable.subscriptions.create "PresenceChannel",
  connected: =>
    @get_in

  disconnected: =>
    @exit

  received: (data) ->
    if data.presence is true
      li = $ "<li>"
      li.html data.username
      li.attr 'id' , data.username
      li.attr 'class' , "connected-user"
      $('#connected-users-list').append(li)
    else
      $('#'+data.username).remove()

  get_in: ->
    @perform 'get_in'


  exit:  ->
    @perform 'unsubscribed'
