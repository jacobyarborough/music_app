class PlaylistSongsController < ApplicationController 
  def destroy 
    playlist_song = PlaylistSong.find_by(playlist_id: params[:playlist_id], song_id: params[:song_id])
    playlist_song.destroy

    flash[:notice] = "Song has been successfully removed"
    redirect_to "/playlists/#{params[:playlist_id]}"
  end
end 