class UsersController < ApplicationController
  before_action :require_user, except: :new
  before_action :set_user, only: [:edit, :update, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
     
    if @user.save
      flash[:notice] = "You have been registered."
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your profile has been updated."
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :timezone)
  end
  
  def set_user
    @user = current_user
  end
end