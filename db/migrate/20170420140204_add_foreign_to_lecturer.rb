class AddForeignToLecturer < ActiveRecord::Migration[5.0]
  def change
  	add_reference :lecturers, :department, index: true
    add_foreign_key :lecturers, :departments
  end
end
