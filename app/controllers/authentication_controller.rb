class AuthenticationController < ApplicationController
  skip_before_action :ensure_current_user

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'You have successfully logged in!'
    else
      flash[:notice] = "Username / password combination is invalid"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'You have successfully signed out!'
  end

end
