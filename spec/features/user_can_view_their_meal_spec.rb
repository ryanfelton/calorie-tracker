require "rails_helper"

feature "User can view their meals" do
  let(:user) { FactoryGirl.create(:user) }
  let(:meal) { FactoryGirl.build(:meal) }
  # let!(:meal) { FactoryGirl.create(:meal, user: user) }

  scenario "creating a meal and viewing it" do
    sign_in(user)

    click_link "New Meal"
    fill_in "Name", with: meal.name
    fill_in "Number of calories", with: meal.number_of_calories
    click_button "Create Meal"

    within("#notice") do
      expect(page).to have_content "Meal was successfully created."
    end
    click_link "Back"

    within "table.table" do
      expect(page).to have_content meal.name
      expect(page).to have_content meal.number_of_calories
    end
  end
end
