class PasswordsController < ApplicationController 
  before_action :require_user_logged_in!

  def edit 
  end 

  def update 
    if Current.user.update(password_params)
      flash[:notice] = "Successfully changed password"
      redirect_to root_path
    else 
      flash[:alert] = "Something went wrong, try again"
      redirect_to password_path
    end
  end 

  private 

  def password_params 
    params.require(:user).permit(:password, :password_confirmation)
  end 
end 