class AddTakeTable < ActiveRecord::Migration[5.0]
  def change
  	create_table :takes, id: false do |t|
      t.belongs_to :student, index: true
      t.belongs_to :course, index: true
    end

    create_table :teaches, id: false do |t|
      t.belongs_to :lecturer, index: true
      t.belongs_to :course, index: true
    end
  end
end
