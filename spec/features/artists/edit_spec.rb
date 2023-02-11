require "rails_helper" 

RSpec.describe "Artist Edit Page", type: :feature do 
  it "displays a form where you can edit the artist" do 
    prince = Artist.create!(name: 'Prince')
    rtj = Artist.create!(name: 'Run The Jewels')
    caamp = Artist.create!(name: 'Caamp')

    visit "/artists/#{prince.id}/edit" 

    fill_in "Name", with: "Princy"
    click_on "Update Artist"

    expect(page).to have_current_path("/artists")
    expect(page).to have_content("Princy")
  end 
end 