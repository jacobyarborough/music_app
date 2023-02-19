Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, Rails.application.credentials.spotify[:spotify_client_id], Rails.application.credentials.spotify[:spotify_client_secret], scope: %w(
    playlist-read-private
    user-read-private
    user-read-email
    playlist-modify-public
  ).join(' ')
end