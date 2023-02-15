require "rails_helper" 

RSpec.describe "Playlist Songs new page" do 
  it "displays a form to add a song to an existing playlist" do 
    prince = Artist.create!(name: "Prince")
    hello = prince.songs.create!(title: "Hello", length: 5489, play_count: 21498)

    jams = Playlist.create!(name: "Jams")

    # PlaylistSong.create!(song: purple, playlist: jams)
    # PlaylistSong.create!(song: place, playlist: jams)

    visit "/songs/#{hello.id}"
    click_on "Add to Playlist" 

    
  end
end 