class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(user_id: params[:session][:user_id].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user

      redirect_to student_home_page_path
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
