require "rails_helper"

RSpec.describe "Artist Index Page", type: :feature do 
  it "displays all artist and artist info" do 
    prince = Artist.create!(name: 'Prince')
    rtj = Artist.create!(name: 'Run The Jewels')
    caamp = Artist.create!(name: 'Caamp')

    visit("/artists") 

    expect(current_path).to eq("/artists")
    expect(page).to have_content("All Artists")
    expect(page).to have_content(prince.name)
    expect(page).to have_content(rtj.name)
    expect(page).to have_content(caamp.name)

    click_link("Home")
    expect(page).to have_current_path("/")
  end  

  it "has a delete button next to each artist" do 
    prince = Artist.create!(name: 'Prince')
    rtj = Artist.create!(name: 'Run The Jewels')
    caamp = Artist.create!(name: 'Caamp')

    visit "/artists"

    within("#artist#{prince.id}") do 
      click_on("Delete")
    end 

    expect(page).to have_current_path("/artists")
    expect(page).to_not have_content(prince.name)
  end 

  it "has an edit button next to each artist" do 
    prince = Artist.create!(name: 'Prince')
    rtj = Artist.create!(name: 'Run The Jewels')
    caamp = Artist.create!(name: 'Caamp')

    visit "/artists" 

    within("#artist#{rtj.id}") do 
      click_on("Edit")
      expect(page).to have_current_path("/artists/#{rtj.id}/edit")
    end 
  end 
end 