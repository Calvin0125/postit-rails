class SessionsController < ApplicationController
  def new
    if logged_in?
      flash[:notice] = "You are already logged in."
      redirect_to root_path
    else
      render :login
    end
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You have been logged in."
      redirect_to root_path
    else
      flash[:alert] = "There was a problem with your username or password."
      render :login
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_path
  end
end