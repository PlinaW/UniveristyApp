class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the UnivApp #{@user.name}. User was created successfully."
      redirect_to users_path
    else
      render 'new'
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
