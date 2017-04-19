class AddIndexToUsersUId < ActiveRecord::Migration[5.0]
  def change
  	add_index :users, :u_id, unique: true
  end
end
