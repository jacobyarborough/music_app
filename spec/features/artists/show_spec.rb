require "rails_helper" 

RSpec.describe "Artist Show Page", type: :feature do
  it "shows a particular artists info" do 
    prince = Artist.create!(name: 'Prince')

    visit "/artists/#{prince.id}"

    expect(page).to have_content("Artist Info")
    expect(page).to have_current_path("/artists/#{prince.id}")
    expect(page).to have_content(prince.name)

    click_link("Back")
    expect(page).to have_current_path("/artists")

    visit "/artists/#{prince.id}"

    click_link("Home")
    expect(page).to have_current_path("/")
  end 
end 