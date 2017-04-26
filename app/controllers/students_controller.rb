class StudentsController < ApplicationController
  before_action :logged_in_user, only: :homepage
  before_action :correct_user_type, only: :homepage
  def homepage
  	@student_courses = current_user.student.courses
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
