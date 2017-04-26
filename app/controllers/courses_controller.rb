class CoursesController < ApplicationController
  before_action :logged_in_user, only: :show
  before_action :correct_member, only: :show
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
    
  end

  def index
  	
  end

  private
    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_member
      #current course
      @course = Course.find(params[:id])
      @course_lecturer_id = @course.lecturers.first.id
      @course_student_ids = @course.students.to_a.map { |each| each[:id]}
      #check type of user
      if current_user.is_a.eql? 'lecturer'
        unless current_user.lecturer.id == @course_lecturer_id
         flash[:danger] = "You not belong to this course"
         redirect_to(root_url) 
        end
      else current_user.is_a.eql? 'student'
        unless @course_student_ids.include? current_user.student.id
         flash[:danger] = "You not belong to " + @course.title + " course"
         redirect_to(root_url) 
       end
     end
   end

      
    
end
