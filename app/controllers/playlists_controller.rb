class PlaylistsController < ApplicationController 
  def index 
    @playlists = Playlist.all
  end

  def show 
    @playlist = Playlist.find(:playlist_id)
  end
end