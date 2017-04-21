class RegisterCoursesController < ApplicationController
  def new
  	
  	@courses = Course.where(department_id: current_user.student.department_id)
  end
 

  def create
  	courses_taken = params[:courses_taken]
  	courses_taken.each do |course_id|
  		Take.create!(student_id: current_user.id, course_id: course_id)
  	end
  	redirect_to student_home_page_path

  end
end
