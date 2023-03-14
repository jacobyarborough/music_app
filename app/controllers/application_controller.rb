class ApplicationController < ActionController::Base
  before_action :set_current_user, :spotify_expired?
  helper_method :cart

  def set_current_user 
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end 
  end 

  def require_user_logged_in!
    redirect_to sign_in_path, alert: "You must be signed in to access this page" if Current.user.nil?
  end 

  def cart 
    @cart ||= Cart.new(session[:cart])
  end

  def spotify_expired?
    if Current.user && Current.user.spotify_accounts
      conn = Faraday.new("https://api.spotify.com")

      response = conn.get("/v1/browse/featured-playlists") do |req|
        req.headers = { Authorization: "Bearer #{Current.user.spotify_accounts.first.token}" }
      end 

      featured_playlists = JSON.parse(response.body, symbolize_names: true)

      if featured_playlists[:error]
        Current.user.refresh_spotify_token
      end
    end
  end 
end
