class StudentsController < ApplicationController
  def homepage
  	@student_courses = current_user.student.courses
  end

  
end
