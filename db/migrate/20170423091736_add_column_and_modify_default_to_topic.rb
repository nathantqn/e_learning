class AddColumnAndModifyDefaultToTopic < ActiveRecord::Migration[5.0]
  def change
  	 change_column :topics, :is_final_exam, :boolean, default: false
  	 add_column :topics, :duration, :integer, default: 0 
  end
end
