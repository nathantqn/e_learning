class RegisterCoursesController < ApplicationController
  before_action :logged_in_user, only: :new
  before_action :correct_user_type, only: :new

  def new
  	if current_user.student.courses.any?
  	@courses_dept = Course.where(department_id: current_user.student.department_id)
    #array ids of courses taken
    courses_taken = current_user.student.courses.to_a.map {|each| each[:id]}
    #courses can register
    @courses = @courses_dept.where.not('id in (?)',courses_taken)
    else
      @courses = Course.where(department_id: current_user.student.department_id)
    end
  end
 

  def create
  	courses_taken = params[:courses_taken]
  	courses_taken.each do |course_id|
  		Take.create!(student_id: current_user.student.id, course_id: course_id)
  	end
  	
  	redirect_to student_home_page_path, :flash => { :success => 'You successfully registered courses' }


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
    def correct_user_type
      user_type = current_user.is_a
      redirect_to(root_url) unless user_type.eql? 'student'
    end
end
