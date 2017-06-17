class Notifications
  constructor: ->
    @notifications = $("[data-behavior='notifications']")
    # The existence of notification div
    @setup() if @notifications.length > 0
  log_test: ->
    console.log "hello xai dc roi ne"
  setup: ->

    $("[data-behavior='notifications']").on "click", @handleClick
    # Get data of notification for current_user,
    # if data successfully recieved, @handleSuccess function executed
    $.ajax(
      url: "/notifications.json"
      dataType: "JSON"
      method: "GET"
      success: @handleSuccess
    )

  # Update read_at attribute for all notification of this user
  handleClick: (e) =>
    $.ajax(
      url: "/notifications/mark_as_read"
      dataType: "JSON"
      method: "POST"
      success: =>
          $("[data-behavior='unread-count']").text(0)
    )

  # Map each notification to link
  handleSuccess: (data) =>
    console.log(data)
    items = $.map data, (notification) ->
      # unclicked notification
      if notification.clicked_at == null
        "<a class='item' onclick='Notifications.log_test()' href='#{notification.url}'><div class='ui red empty circular label'></div> #{notification.actor} #{notification.action} #{notification.notifiable.type}</a>"
      else
        "<a class='item' onclick='Notifications.log_test()' href='#{notification.url}'>#{notification.actor} #{notification.action} #{notification.notifiable.type}</a>"
    # The noti amount depends on attribu  te: read_at == null
    filter_not_read = data.filter (noti) -> noti.read_at == null
    total_noti = filter_not_read.length


    # Add amount of notification to label
    $("[data-behavior='unread-count']").text(total_noti)

    # Add all notifications to div
    $("[data-behavior='notification-items']").html(items)

# Document onload jquery, call new class Notifications
$(document).on 'turbolinks:load', ->
    new Notifications
