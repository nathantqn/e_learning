json.array! @notifications do |notification|
  #json.recipient notification.recipient
  json.read_at notification.read_at
  json.clicked_at notification.clicked_at
  json.id notification.id
  json.actor notification.actor.user.generalinfo.first_name
  json.action notification.action
  json.notifiable do #notification.notifiable
    json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
  json.url topic_path(notification.notifiable.topic, anchor: dom_id(notification.notifiable))
end
