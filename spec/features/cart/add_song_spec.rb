require "rails_helper"

RSpec.describe "When a user adds a song to their cart" do 
  it "displays a message" do 
    artist = Artist.create(name: 'Rick Astley')
    song = artist.songs.create(title: 'Never Gonna Give You Up', length: 250, play_count: 1000000)

    visit "/songs/#{song.id}"

    click_on("Add Song to Cart")

    expect(page).to have_content("You now have 1 copy of #{song.title} in your cart")
  end

  it "the message correctly increments for multiple songs" do
    artist = Artist.create(name: 'Rick Astley')
    song_1 = artist.songs.create(title: 'Never Gonna Give You Up', length: 250, play_count: 1000000)
    song_2 = artist.songs.create(title: "Don't Stop Believin'", length: 300, play_count: 1)

    visit "/songs/#{song_1.id}"
    click_button "Add Song"

    visit "/songs/#{song_2.id}"
    click_button "Add Song"

    visit "/songs/#{song_1.id}"
    click_button "Add Song"

    expect(page).to have_content("You now have 2 copies of #{song_1.title} in your cart.")
  end

  it "shows the total number of items in the cart" do 
    artist = Artist.create(name: 'Rick Astley')
    song_1 = artist.songs.create(title: 'Never Gonna Give You Up', length: 250, play_count: 1000000)
    song_2 = artist.songs.create(title: "Don't Stop Believin'", length: 300, play_count: 1)

    visit "/songs"

    expect(page).to have_content("Cart: 0")

    within("#song-#{song_1.id}") do
      click_button "Add Song"
    end

    expect(page).to have_content("Cart: 1")

    within("#song-#{song_2.id}") do
      click_button "Add Song"
    end

    expect(page).to have_content("Cart: 2")

    within("#song-#{song_1.id}") do
      click_button "Add Song"
    end

    expect(page).to have_content("Cart: 3")
  end
end