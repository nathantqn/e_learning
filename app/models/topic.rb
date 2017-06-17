class Topic < ApplicationRecord
	has_many :students, through: :comments
	belongs_to :lecturer
	belongs_to :course
	has_many :comments
	has_many :topic_scores
	default_scope -> {order(created_at: :desc)}
	validates :lecturer_id, presence: true
	validates :course_id, presence: true
	validates :title, presence: true
end
