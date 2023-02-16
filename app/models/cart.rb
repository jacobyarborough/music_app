class Cart 
  attr_reader :session_cart_contents

  def initialize(session_cart_contents)
    @session_cart_contents = session_cart_contents || Hash.new(0)
  end 

  def add_song(song_id)
    session_cart_contents[song_id] ||= 0
    session_cart_contents[song_id] += 1
  end

  def count_of(song_id)
    session_cart_contents[song_id].to_i
  end

  def total_items 
    session_cart_contents.values.sum
  end 

  def get_items 
    cart_hash = {}

    songs = Song.get_songs(session_cart_contents.keys)
    songs.each do |song|
      cart_hash[song] = session_cart_contents[song.id.to_s]
    end 

    cart_hash
  end
end