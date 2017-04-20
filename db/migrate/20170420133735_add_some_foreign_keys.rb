class AddSomeForeignKeys < ActiveRecord::Migration[5.0]
  def change
  	add_reference :courses, :department, index: true
    add_foreign_key :courses, :departments
    add_reference :students, :user, index: true
    add_foreign_key :students, :users
    add_reference :students, :department, index: true
    add_foreign_key :students, :departments
  end
end
