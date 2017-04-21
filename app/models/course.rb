class Course < ApplicationRecord
	belongs_to :department
	has_and_belongs_to_many :students
	has_many :teaches
	has_many :lecturers, through: :teaches
end
