class AddMoreForeignKeys < ActiveRecord::Migration[5.0]
  def change
  	add_reference :topics, :lecturer, index: true
    add_foreign_key :topics, :lecturers
    add_reference :topics, :course, index: true
    add_foreign_key :topics, :courses
    add_reference :comments, :student, index: true
    add_foreign_key :comments, :students
    add_reference :comments, :topic, index: true
    add_foreign_key :comments, :topics
  end
end
