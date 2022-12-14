class UsersController < ApplicationController
before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    
  end
  
  def index
    @users = User.all
    @user = User.new
    @book = Book.new
  end
  
  def new
    @user = User.new(user_params)
  end
  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to "/users/#{current_user.id}"
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  def destroy
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end
end