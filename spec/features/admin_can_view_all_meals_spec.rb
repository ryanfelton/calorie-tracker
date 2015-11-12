require "rails_helper"

feature "Admin can view meals" do
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:meal1) { FactoryGirl.create(:meal, user: user1) }
  let!(:meal2) { FactoryGirl.create(:meal, user: user2) }

  scenario "for all users" do
    expect(meal1.user).not_to eq meal2.user

    sign_in(admin)
    visit meals_path

    within "tbody" do
      expect(page).to have_content meal1.name
      expect(page).to have_content meal1.number_of_calories

      expect(page).to have_content meal2.name
      expect(page).to have_content meal2.number_of_calories

    end
  end
end
