class CreateGeneralinfos < ActiveRecord::Migration[5.0]
  def change
    create_table :generalinfos do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :dob

      t.timestamps
    end
  end
end
