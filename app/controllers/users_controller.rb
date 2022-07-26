class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]



  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to ("/users/#{current_user.id}")
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
    redirect_to user_path(current_user)
    end
  end

end