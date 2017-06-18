class NotificationsController < ApplicationController

  def index
    @notifications = Notification.where(recipient: current_user.student)

  end

  def mark_as_read
    @notifications = Notification.where(recipient: current_user.student).unread
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end

  def method_name

  end

  def update
    @notification = Notification.find(params[:id])
    @notification.update_attribute(:clicked_at, Time.zone.now)
    redirect_to @notification.notifiable.topic
  end
end
