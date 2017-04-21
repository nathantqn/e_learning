class Lecturer < ApplicationRecord
	belongs_to :department
	has_many :teaches
	has_many :courses, through: :teaches
	belongs_to :user
end
