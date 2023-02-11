require "rails_helper" 

RSpec.describe "New Artist Page", type: :feature do 
  it "shows a form to create a new artist" do 
    visit "/artists" 
    click_link "Add New Artist"
    expect(page).to have_current_path("/artists/new")

    fill_in("Name", with: "Beach Boys")
    click_on("Create Artist")
    expect(page).to have_current_path("/artists")
    expect(page).to have_content("Beach Boys")
  end 
end 