class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :u_id
      t.string :is_a

      t.timestamps
    end
  end
end
