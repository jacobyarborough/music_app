class WelcomeService 
  def get_playlists
    response = conn.get("/v1/browse/featured-playlists") do |req|
      req.headers = { Authorization: "Bearer #{Current.user.spotify_accounts.first.token}" }
    end 

    JSON.parse(response.body, symbolize_names: true)
  end 

  def conn 
    Faraday.new("https://api.spotify.com")
  end 
end 