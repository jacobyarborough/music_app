require "rails_helper"

RSpec.describe "New song page", type: :feature do 
  it "displays a form to create a new song" do 
    artist = Artist.create!(name: "Smashing Pumpkins")
    title = "hello"
    length = 200
    play_count = 15681

    visit "/artists/#{artist.id}/songs/new" 

    fill_in("Title", with: title)
    fill_in("Length", with: length)
    fill_in("Play Count", with: play_count)

    click_on("Create Song")

    new_song = Song.last 

    expect(current_path).to eq("/songs/#{new_song.id}")
    expect(page).to have_content(new_song.title)
    expect(page).to have_content(new_song.length)
    expect(page).to have_content(new_song.play_count)
    expect(page).to have_content(artist.name)
  end 
end 