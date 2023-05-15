class SessionsController < ApplicationController

  skip_before_action :require_user, only: [:new, :create]
  def new

  end

  def create
    @user = User.find_by(email: params[:email].downcase)
    if @user and @user.authenticate(params[:password])
      flash[:notice] = "Welcome #{@user.name}. Please, explore all the things."
      session[:user_id] = @user.id
      cookies[:return_to_url] = root_url if cookies[:return_to_url].include? "logout"
      redirect_to cookies[:return_to_url] || root_path
      cookies[:return_to_url] = nil
    else
      flash[:error] = "Something went wrong. Please, try again in a few moments."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out!"
    redirect_to login_path
  end
end