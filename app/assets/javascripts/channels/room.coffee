App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    if data.noti
      $("[data-behavior='notification-items']").prepend(data.message)
      $("[data-behavior='unread-count']").text(data.total_noti)
