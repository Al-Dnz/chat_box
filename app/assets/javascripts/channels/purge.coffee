App.purge = App.cable.subscriptions.create "PurgeChannel",
  connected: ->
    $('#purge-btn').click =>
      #console.log("PUUURGGGE")
      @purge()

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log('purged!')
    document.getElementById('posts_div').innerHTML = data.purger+' has purged the chan !!!!'


  purge: ->
   #document.getElementById('posts_div').innerHTML = 'purged !'
    @perform 'purge'
