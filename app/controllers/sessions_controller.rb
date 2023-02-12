class SessionsController < ApplicationController 
  def new
  end 

  def destroy
    session[:user_id] = nil

    flash[:notice] = "logged out successfully"
    redirect_to root_path
  end 
end