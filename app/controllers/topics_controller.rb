class TopicsController < ApplicationController
	
  def show
    @topic = Topic.find(params[:id])
    if @topic.topic_scores.any?
    @topic_score = TopicScore.find_by(topic_id: @topic.id)
    else
      @topic_score = TopicScore.new
    end
    
  end
	 def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to @topic.course
    else

      redirect_to @topic.course, :flash => { :warning => 'Something went wrong! Cannot post your topic' }
    end
  end

  private

    def topic_params
      params.require(:topic).permit(:title, :lecturer_id, :course_id, :duration, :is_final_exam)
                                   
    end
end
