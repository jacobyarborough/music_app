require "rails_helper" 

RSpec.describe "sessions new page", type: :feature do 
  context "user has valid login credentials" do 
    it "displays a login form" do 
      user = User.create(email: "test@mail.com", password: "password", password_confirmation: "password")

      visit root_path

      click_on("Sign In")
      expect(page).to have_current_path(sign_in_path)
      fill_in("Email", with: "test@mail.com")
      fill_in("Password", with: "password")

      within("#sign-in-button") do 
        click_on("Sign In")
      end 

      expect(page).to have_current_path(root_path)
      expect(page).to have_content("Signed in as #{user.email}")
    end 
  end 

  context "user has invalid login credentials" do 
    it "will display an error message" do 
      user = User.create(email: "test@mail.com", password: "password", password_confirmation: "password")

      visit root_path

      click_on("Sign In")
      expect(page).to have_current_path(sign_in_path)
      fill_in("Email", with: "test@mail.com")
      fill_in("Password", with: "passwo")

      within("#sign-in-button") do 
        click_on("Sign In")
      end 

      expect(page).to have_current_path(sign_in_path)
      expect(page).to have_content("Invalid email or password")
    end 
  end 
end 