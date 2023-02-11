require "rails_helper"

RSpec.describe "Welcome Page", type: :feature do
  it "displays a welcome message" do 
    visit "/"

    expect(current_path).to eq("/")
    expect(page).to have_content("Welcome to the SetList App!")

    click_link("Artists")
    expect(page). to have_current_path("/artists")
    click_link("Home")
    expect(page).to have_current_path("/")

    click_link("Songs")
    expect(page). to have_current_path("/songs")
    click_link("Home")
    expect(page).to have_current_path("/")
  end 
end 