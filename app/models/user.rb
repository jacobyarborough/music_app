# email:string
# password_digest:string
#
# password:string virtual
# password_confirmation:string virtual 

class User < ApplicationRecord
  has_many :spotify_accounts 
  
  has_secure_password 

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email" }

  def refresh_spotify_token 
    refresh_token = spotify_accounts.first.refresh_token

    url = "https://accounts.spotify.com/api/token"

    body = {
      grant_type: "refresh_token",
      refresh_token: refresh_token,
      client_id: Rails.application.credentials.spotify[:spotify_client_id],
      client_secret: Rails.application.credentials.spotify[:spotify_client_secret]
    }

    response = Faraday.post(url, body)

    auth_params = JSON.parse(response.body, symbolize_names: true)

    spotify_accounts.first.update(token: auth_params[:access_token])
  end 
end
