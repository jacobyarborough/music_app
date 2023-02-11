class Artist < ApplicationRecord
  validates_presence_of :name

  has_many :songs, dependent: :destroy

  def average_song_length
    songs.average(:length)
  end

  # wouldnt actually need this method, just reviewing
  def return_in_order
    songs.return_in_order
  end 

  # wouldnt actually need this method, just reviewing
  def get_shortest(count)
    songs.return_shortest(count)
  end 

  def get_played_songs 
    songs.where("play_count > ? and length > ?", 1, 0).return_in_order
  end 
end