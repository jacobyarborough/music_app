require "rails_helper" 

RSpec.describe "Cart index page", type: :feature do 
  it "displays list of items in the cart" do 
    artist = Artist.create(name: 'Rick Astley')
    song_1 = artist.songs.create(title: 'Never Gonna Give You Up', length: 250, play_count: 1000000)
    song_2 = artist.songs.create(title: "Don't Stop Believin'", length: 300, play_count: 1)

    visit "/songs/#{song_1.id}"
    click_on("Add Song to Cart")

    visit "/songs/#{song_2.id}"
    click_on("Add Song to Cart")

    visit "/songs/#{song_1.id}"
    click_on("Add Song to Cart")

    click_on("Cart: 3")

    expect(page).to have_current_path(cart_path)
    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_1.play_count)
    expect(page).to have_content("Quantity: 2")
    expect(page).to have_content(song_1.artist.name)

    expect(page).to have_content(song_2.title)
    expect(page).to have_content(song_2.play_count)
    expect(page).to have_content("Quantity: 2")
    expect(page).to have_content(song_2.artist.name)
  end
end