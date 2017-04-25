class RegisterCoursesController < ApplicationController
  def new
  	
  	@courses_dept = Course.where(department_id: current_user.student.department_id)
    #array ids of courses taken
    courses_taken = current_user.student.courses.to_a.map {|each| each[:id]}
    #courses can register
    @courses = @courses_dept.where.not('id in (?)',courses_taken)
    
  end
 

  def create
  	courses_taken = params[:courses_taken]
  	courses_taken.each do |course_id|
  		Take.create!(student_id: current_user.student.id, course_id: course_id)
  	end
  	
  	redirect_to student_home_page_path, :flash => { :success => 'You successfully registered courses' }


  end
end
