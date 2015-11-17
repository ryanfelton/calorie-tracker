require "rails_helper"

feature "User can onboard", js: true do

  scenario "create an account, login, and logout" do
    user = FactoryGirl.build(:user)

    visit root_path

    expect(page).to have_content "Login"

    click_link "Signup"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create user"

    expect(page).to have_content "User created, please login."

    # Login
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Login"

    expect(page).to have_content "Recent Meals"

    within(".navbar") do
      expect(page).to have_content user.email
      expect(page).to have_content "Logout"
      find("#logout").click
    end
    expect(page).to have_content "Logged out successfully!"
  end
end
