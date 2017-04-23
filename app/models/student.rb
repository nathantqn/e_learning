class Student < ApplicationRecord
	belongs_to :department
	has_many :takes
	has_many :courses, through: :takes
	belongs_to :user
	has_many :comments
	has_many :topic_scores
end
