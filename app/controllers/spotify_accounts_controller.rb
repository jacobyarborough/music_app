class SpotifyAccountsController < ApplicationController 
  before_action :require_user_logged_in!

  def index 
    @spotify_accounts = Current.user.spotify_accounts
  end

  def destroy 
    spotify_account = Current.user.spotify_accounts.find(params[:id])
    spotify_account.destroy

    flash[:notice]="Account successfuly disconnected"
    redirect_to spotify_accounts_path
  end 
end