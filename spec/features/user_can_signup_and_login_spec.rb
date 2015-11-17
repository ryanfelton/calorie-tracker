require "rails_helper"

feature "User can onboard", js: true do

  scenario "create an account, login, and logout" do
    user = FactoryGirl.build(:user)

    sign_in(user)

    expect(page).to have_content "Recent Meals"

    within(".navbar") do
      expect(page).to have_content user.email
      expect(page).to have_content "Logout"
      find("#logout").click
    end
    expect(page).to have_content "Logged out successfully!"
  end
end
