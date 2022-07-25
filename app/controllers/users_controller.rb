class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit,:update,:destroy]
  before_action :correct_user, only: [:edit, :update]


  def new
    @book = Book.new
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def new
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(current_user.id)
    else
      render "users/sign_up"
    end
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
    redirect_to(user_path)
    end
  end

end