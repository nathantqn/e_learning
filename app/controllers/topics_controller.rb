class TopicsController < ApplicationController
  before_action :logged_in_user, only: :show
  before_action :is_lecturer, only: :show
	
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


    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:warning] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def is_lecturer
      @topic = Topic.find(params[:id]) 
      user_type = current_user.is_a
      if !user_type.eql? 'lecturer' or current_user.lecturer.id != @topic.lecturer_id
        flash[:warning] = "Not your course"
        redirect_to(root_url) 
    end
  end
end
