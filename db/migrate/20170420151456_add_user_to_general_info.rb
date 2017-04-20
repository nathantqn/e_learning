class AddUserToGeneralInfo < ActiveRecord::Migration[5.0]
  def change
  	add_reference :generalinfos, :user, index: true
    add_foreign_key :generalinfos, :users
  end
end
