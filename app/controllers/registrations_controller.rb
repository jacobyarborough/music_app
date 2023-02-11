class RegistrationsController < ApplicationController 
  def new 
    @user = User.new(params[:user_params])
  end 
end 