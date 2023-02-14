require "rails_helper"

RSpec.describe "Welcome Page", type: :feature do
  it "displays a welcome message" do 
    visit "/"

    expect(current_path).to eq("/")
    expect(page).to have_content("Welcome to the SetList App!")

    within "#banner-artist" do 
      click_link("Artists")
    end 

    expect(page). to have_current_path("/artists")
    click_link("Home")
    expect(page).to have_current_path("/")

    within("#banner-song") do
      click_link("Songs")
    end

    expect(page). to have_current_path("/songs")
    click_link("Home")
    expect(page).to have_current_path("/")
  end 
end 