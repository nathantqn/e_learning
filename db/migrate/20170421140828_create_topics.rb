class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :title
      t.boolean :is_final_exam
      t.datetime :end_at

      t.timestamps
    end
  end
end
