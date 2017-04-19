class AddIndexToUsersUId < ActiveRecord::Migration[5.0]
  def change
  	add_index :users, :user_id, unique: true
  end
end
