require "rails_helper" 

RSpec.describe "registrations new page", type: :feature do 
  context "user enters in acceptable credentials" do 
    it "will successfully create an account and log the user in" do 
      visit root_path 
      click_on("Sign Up")
      expect(page).to have_current_path(sign_up_path)
      fill_in("Email", with: "test@mail.com")
      fill_in("Password", with: "password")
      fill_in("Password confirmation", with: "password")
      click_on("Sign Up!")

      expect(page).to have_current_path(root_path)
      expect(page).to have_content("You have successfully created an account!")
      expect(page).to have_content("test@mail.com")
      expect(page).to have_content("Logout")
      expect(page).not_to have_content("Sign In")
      expect(page).not_to have_content("Sign Up")
    end
  end 

  context "user enters in invalid credentials" do 
    it "will display an error message" do 
      visit root_path 
      click_on("Sign Up")
      expect(page).to have_current_path(sign_up_path)
      fill_in("Email", with: "test@gmail.com")
      fill_in("Password", with: "password")
      fill_in("Password confirmation",with: "pass")
      click_on("Sign Up!")

      expect(page).to have_current_path(sign_up_path)
      expect(page).to have_content("email or password incorrect")
      expect(page).not_to have_content("test@gmail.com")
      expect(page).not_to have_content("Logout")
    end 
  end 
end 