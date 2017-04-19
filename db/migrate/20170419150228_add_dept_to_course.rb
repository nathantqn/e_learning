class AddDeptToCourse < ActiveRecord::Migration[5.0]
  def change
  	add_reference :courses, :dept, references: :departments, index: true
	add_foreign_key :courses, :departments, column: :dept_id
  end
end
