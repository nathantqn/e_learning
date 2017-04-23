class CreateTopicScores < ActiveRecord::Migration[5.0]
  def change
    create_table :topic_scores do |t|
      t.integer :score

      t.timestamps
    end
  end
end
