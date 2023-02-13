class UsersController < ApplicationController

  skip_before_action :require_user, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update]
  
  def index
    @users = User.all
  end

  def show
    
  end

  def new
    @user = User.new
  end

  def edit
    
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the UnivApp #{@user.name}. User was created successfully."
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    
    if @user.update(user_params)
      flash[:notice] = "Your profile was updated successfully"
      redirect_to @user
    else
      render 'edit'
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:notice] = "You can olny edit your own profile"
      redirect_to user_path(current_user) 
    end
  end

end
