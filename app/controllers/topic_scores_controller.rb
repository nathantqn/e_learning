class TopicScoresController < ApplicationController
  def create
  	student_ids = params[:topic_score][:student_id]
  	scores = params[:topic_score][:score]
  	topic_id = params[:topic_score][:topic_id]
  	student_ids.zip(scores).each do |student_id, score|
  		TopicScore.create!(student_id: student_id, score: score, topic_id: topic_id)
  	end

  	redirect_to topic_path(Topic.find(topic_id))
  end

  def update
  	student_ids = params[:topic_score][:student_id]
  	scores = params[:topic_score][:score]
  	topic_id = params[:topic_score][:topic_id]
  	student_ids.zip(scores).each do |student_id, score|
  		@topicScore = TopicScore.where(student_id: student_id, topic_id: topic_id)
  		@topicScore.update(score: score)
  	end
  	redirect_to topic_path(Topic.find(topic_id))
  	
  end
end
