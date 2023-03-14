class DailyPlaylist
  attr_reader :playlist_link,
              :name,
              :owner,
              :tracks_link,
              :image
              
  def initialize(playlist_data)
    @playlist_link = playlist_data[:external_urls][:spotify]
    @name = playlist_data[:name]
    @owner = playlist_data[:owner][:display_name]
    @tracks_link = playlist_data[:tracks][:href]
    @image = playlist_data[:images][0][:url]
  end 
end