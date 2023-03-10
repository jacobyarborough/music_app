class SessionsController < ApplicationController 
  def new
  end 

  def create 
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Signed in as #{user.email}"
      redirect_to root_path
    else 
      flash[:alert] = "Invalid email or password"
      redirect_to sign_in_path
    end 
  end 

  def destroy
    session[:user_id] = nil

    flash[:notice] = "logged out successfully"
    redirect_to root_path
  end 
end