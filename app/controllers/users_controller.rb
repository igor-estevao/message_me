class UsersController < ApplicationController

  skip_before_action :require_user, only: [:new]

  def index
    
  end

  def new
    @user = User.new
  end

end
