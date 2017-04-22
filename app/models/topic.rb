class Topic < ApplicationRecord
	belongs_to :lecturer
	belongs_to :course
	has_many :comments
	default_scope -> {order(created_at: :desc)}
	validates :lecturer_id, presence: true
	validates :course_id, presence: true
	validates :title, presence: true
end
