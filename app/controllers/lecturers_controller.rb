class LecturersController < ApplicationController
  def homepage
  	@lecturer_courses = current_user.lecturer.courses
  end
end
