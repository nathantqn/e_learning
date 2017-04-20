class Department < ApplicationRecord
	has_many :courses
	has_many :students
	has_many :lecturers
end
