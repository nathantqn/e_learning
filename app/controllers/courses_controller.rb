class CoursesController < ApplicationController
  def new
  end

  def create
  	
  end

  def show
  	@course = Course.find(params[:id])
  	@students_of_course = @course.students
  	@topic = Topic.new
  	@all_topics_of_course = Topic.where(course_id: @course.id)
  	@comment = Comment.new
    @latest_scores = @course.topics.order(:created_at).first.topic_scores.order(score: :desc) 
  	
  end

  def index
  	
  end
end
