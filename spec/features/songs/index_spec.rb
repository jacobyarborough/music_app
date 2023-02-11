require "rails_helper"

RSpec.describe "songs index page", type: :feature do 
  it "Can see all song titles and play count" do 
    artist1 = Artist.create(name: "Prince")
    song1 = Song.create!(title: "I really like you", length: 208, play_count: 2468, artist: artist1)
    song2 = artist1.songs.create!(title: "Call me maybe", length: 199, play_count: 1357)

    visit "/songs"

    expect(page).to have_content(song1.title)
    expect(page).to have_content("Play Count: #{song1.play_count}")
    expect(page).to have_content(song2.title)
    expect(page).to have_content("Play Count: #{song2.play_count}")
    expect(page).to have_content("Set List Songs")

    click_link("Home")
    expect(page).to have_current_path("/")
  end 

  it "can show only a particular artist's songs" do 
    prince = Artist.create!(name: 'Prince')
    rtj = Artist.create!(name: 'Run The Jewels') 
    song1 = prince.songs.create!(title: "hello sun", length: 598, play_count: 5897)
    song2 = rtj.songs.create!(title: "hello moon", length: 547, play_count: 547)

    visit "artists/#{prince.id}/songs" 
    expect(page).to have_content(song1.title)
    expect(page).to have_content(song1.play_count)

    expect(page).not_to have_content(song2.title)
    expect(page).not_to have_content(song2.play_count)

    click_link("Home")
    expect(page).to have_current_path("/")
  end 
end 