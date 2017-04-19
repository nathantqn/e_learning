class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :course_id
      t.string :title
      t.integer :credits

      t.timestamps
    end
  end
end
