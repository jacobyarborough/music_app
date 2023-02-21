class WelcomeController < ApplicationController 
  def index
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end 

    conn = Faraday.new("https://api.spotify.com")

    response = conn.get("/v1/browse/featured-playlists") do |req|
      req.headers = { Authorization: "Bearer #{Current.user.spotify_accounts.first.token}" }
    end 

    content = JSON.parse(response.body, symbolize_names: true)

    @message = content[:message]
    @featured_playlists = content[:playlists][:items]
  end
end