class UsersController < ApplicationController
  
  def new
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(current_user.id)
    else
      render "users/sign_up"
    end
  end
  
  def index
    @users = User.all
  end

  def show
  end

  def edit
  end
end
