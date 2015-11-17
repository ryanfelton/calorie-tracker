require "rails_helper"

feature "Admin can view meals", js: true do
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:user1_meal) { FactoryGirl.create(:meal, user: user1) }
  let!(:user2_meal) { FactoryGirl.create(:meal, user: user2) }

  before  do
    sign_in(admin)
  end

  after do
    logout
  end

  scenario "for all users" do
    expect(user1_meal.user).not_to eq user2_meal.user

    within "ul.list-group" do
      expect(page).to have_content user1_meal.name
      expect(page).to have_content user1_meal.number_of_calories

      expect(page).to have_content user2_meal.name
      expect(page).to have_content user2_meal.number_of_calories
    end
  end
end
