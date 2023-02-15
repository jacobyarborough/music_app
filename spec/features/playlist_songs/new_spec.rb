require "rails_helper" 

RSpec.describe "Playlist Songs new page" do 
  it "displays a form to add a song to an existing playlist" do 
    prince = Artist.create!(name: "Prince")
    hello = prince.songs.create!(title: "Hello", length: 5489, play_count: 21498)

    jams = Playlist.create!(name: "Jams")

    # PlaylistSong.create!(song: purple, playlist: jams)
    # PlaylistSong.create!(song: place, playlist: jams)

    visit "/songs/#{hello.id}"
    click_button "Add song to a playlist" 

    click_button("Add song to playlist")

    expect(page).to have_current_path("/songs/#{hello.id}")
    expect(jams.songs).to include(hello)
  end
end 