class AddForeignToTopicScore < ActiveRecord::Migration[5.0]
  def change
  	add_reference :topic_scores, :student, index: true
    add_foreign_key :topic_scores, :students
    add_reference :topic_scores, :topic, index: true
    add_foreign_key :topic_scores, :topics
  end
end
