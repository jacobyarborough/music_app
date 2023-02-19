class WelcomeController < ApplicationController 
  def index
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end 

    # conn = Faraday.get("https://accounts.spotify.com")

    # response = Faraday.get("https://accounts.spotify.com/authorize") do |req|
    #     req.params = {client_id: ENV["spotify_client_id"], response_type: "code", redirect_uri: ENV["spotify_redirect_uri"], scope: ENV["scopes"]}
    # end 

    # redirect_to response.headers[:location]
  end
end