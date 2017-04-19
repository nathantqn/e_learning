class Course < ApplicationRecord
	belongs_to :dept, class_name: "Department"
end
