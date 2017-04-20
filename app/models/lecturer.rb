class Lecturer < ApplicationRecord
	belongs_to :department
	has_and_belongs_to_many :courses
	belongs_to :user
end
