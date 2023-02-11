class SongsController < ApplicationController
  def index 
    if params[:artist_id]
      @songs = Song.where(artist_id: params[:artist_id])
    else 
      @songs = Song.all
    end
  end 

  def show
    @song = Song.find(params[:id])
  end 

  def new
    @artist = Artist.find(params[:id])
  end 

  def create
    song = Song.new(song_params)
    song.artist_id = params[:id]
    song.save!

    redirect_to "/songs/#{song.id}"
  end 

  private

  def song_params
    params.permit(:title, :length, :play_count)
  end 
end 