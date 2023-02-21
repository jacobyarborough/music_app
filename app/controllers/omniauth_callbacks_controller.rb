class OmniauthCallbacksController < ApplicationController
  def spotify
    # Rails.logger.info auth
   
    spotify_account = Current.user.spotify_accounts.where(username: auth.info.nickname).first_or_initialize
    spotify_account.update(
      name: auth.info.name, 
      username: auth.info.nickname,
      image: auth.info.image,
      token: auth.credentials.token,
      refresh_token: auth.credentials.refresh_token,
      spotify_url: auth.info.urls.spotify
    )

    flash[:notice]="Successfully connected account"
    redirect_to root_path
  end

  def auth 
    request.env['omniauth.auth']
  end 
end