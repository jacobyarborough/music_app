class SpotifyAccountsController < ApplicationController 
  def index 
    @spotify_accounts = Current.user.spotify_accounts
  end
end