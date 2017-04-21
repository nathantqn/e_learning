class Topic < ApplicationRecord
	belongs_to :lecturer
	belongs_to :course
	has_many :comments
end
