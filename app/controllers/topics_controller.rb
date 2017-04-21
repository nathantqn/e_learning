class TopicsController < ApplicationController
	
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
      params.require(:topic).permit(:title, :lecturer_id, :course_id)
                                   
    end
end
