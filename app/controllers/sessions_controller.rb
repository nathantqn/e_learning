class SessionsController < ApplicationController
  def new
    if current_user
    if current_user.is_a.eql? 'student'
      redirect_to student_home_page_path
      elsif current_user.is_a.eql? 'lecturer'
         redirect_to lecturer_home_page_path
      end
    end
  end

  def create
    user = User.find_by(user_id: params[:session][:user_id].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      if user.is_a.eql? 'student'
      redirect_to student_home_page_path
      elsif user.is_a.eql? 'lecturer'
         redirect_to lecturer_home_page_path
      end
    else
      flash.now[:negative] = 'Invalid id/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
