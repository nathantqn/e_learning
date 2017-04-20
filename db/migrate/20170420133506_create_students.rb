class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.integer :total_credit

      t.timestamps
    end
  end
end
