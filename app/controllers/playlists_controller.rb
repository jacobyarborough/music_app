class PlaylistsController < ApplicationController 
  def index 
    @playlists = Playlist.all
  end

  def show 
    @playlist = Playlist.find(params[:playlist_id])
  end
end