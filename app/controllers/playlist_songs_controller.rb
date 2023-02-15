class PlaylistSongsController < ApplicationController 
  def new 
    @song = Song.find(params[:song_id])
    @playlist_song = PlaylistSong.new
    @playlists = Playlist.all
  end 

  def create 
    playlist_song = PlaylistSong.new(playlist_song_params)
    playlist_song.save

    flash[:notice]="Song has been successfully added to the playlist"
    redirect_to "/songs/#{playlist_song_params[:song_id]}"
  end

  def destroy 
    playlist_song = PlaylistSong.find_by(playlist_id: params[:playlist_id], song_id: params[:song_id])
    playlist_song.destroy

    flash[:notice] = "Song has been successfully removed"
    redirect_to "/playlists/#{params[:playlist_id]}"
  end

  private 

  def playlist_song_params 
    params.require(:playlist_song).permit(:playlist_id, :song_id)
  end 
end 