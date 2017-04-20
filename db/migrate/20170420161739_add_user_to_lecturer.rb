class AddUserToLecturer < ActiveRecord::Migration[5.0]
  def change
  	add_reference :lecturers, :user, index: true
    add_foreign_key :lecturers, :users
  end
end
