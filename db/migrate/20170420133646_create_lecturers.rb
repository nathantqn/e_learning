class CreateLecturers < ActiveRecord::Migration[5.0]
  def change
    create_table :lecturers do |t|
      t.float :salary
      t.string :rank

      t.timestamps
    end
  end
end
