class Course < ApplicationRecord
	belongs_to :department
	
	has_many :teaches
	has_many :lecturers, through: :teaches
	has_many :takes
	has_many :students, through: :takes
	has_many :topics
end
