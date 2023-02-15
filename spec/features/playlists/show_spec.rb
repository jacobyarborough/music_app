require "rails_helper"

RSpec.describe "playlists show page", type: :feature do 
  it "displays a particular playlist and its songs" do 
    talking_heads = Artist.create!(name: "Talking Heads")
    jgb = Artist.create!(name: "Jerry Garcia Band")
    prince = Artist.create!(name: "Prince")

    place = talking_heads.songs.create!(title: "This Must Be The Place", length: 56, play_count: 2540)
    breadbox = jgb.songs.create!(title: "Aint No Bread In The Breadbox", length: 890, play_count: 25)
    r_and_c = jgb.songs.create!(title: "Reuben and Chersie", length: 945, play_count: 2456)
    hello = prince.songs.create!(title: "Hello", length: 5489, play_count: 21498)

    jams = Playlist.create!(name: "Jams")

    PlaylistSong.create!(song: breadbox, playlist: jams)
    PlaylistSong.create!(song: place, playlist: jams)
    PlaylistSong.create!(song: hello, playlist: jams)

    visit "/playlists/#{jams.id}"

    expect(page).to have_content(breadbox.title)
    expect(page).to have_content(place.title)
    expect(page).to have_content(hello.title)
  end 
end 