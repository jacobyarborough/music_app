class PasswordResetController < ApplicationController
  def new 
  end 

  def create 
    @user = User.find_by(email: params[:email])
    
    if @user.present? 
      # send email
      # got to password mailer
      # we want to send a reset email 
      # we want to include a user parameters
      # deliver later in a background job (deliver now for test)
      PasswordMailer.with(user: @user).reset.deliver_now
    end 

    flash[:notice] = "If that email is found, a reset email link will be sent"
    redirect_to root_path
  end
  
  def edit 
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    flash[:notice] = "Link has expired"
    redirect_to password_reset_path
  end 

  def update 
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(user_params)
      flash[:notice] = "Password has been successfully updated"
      redirect_to sign_in_path
    else 
      flash[:alert] = "Something went wrong, please try again"
      redirect_to password_reset_edit_path(token: params[:token])
    end 
  end 

  private 

  def user_params 
    params.require(:user).permit(:password, :password_confirmation)
  end 
end