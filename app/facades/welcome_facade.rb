class WelcomeFacade
  def daily_playlists
    service = WelcomeService.new

    json = service.get_playlists

    @daily_playlists = json[:playlists][:items].map do |playlist_data|
      DailyPlaylist.new(playlist_data)
    end 
  end 
end