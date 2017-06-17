class Notification < ApplicationRecord
  belongs_to :recipient, class_name: "Student"
  belongs_to :actor, class_name: "Student"
  belongs_to :notifiable, polymorphic: true
  default_scope -> { order(created_at: :desc) }
  scope :unread, ->{ where(read_at: nil) }
end
