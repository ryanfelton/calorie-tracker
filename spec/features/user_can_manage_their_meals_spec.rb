require "rails_helper"

feature "User can manage their meals", js: true do

  scenario "create a meal" do
    user = FactoryGirl.build(:user)
    meal = FactoryGirl.build(:meal, user: user)

    sign_in(user)

    # Create
    within(".panel-heading") do
      click_button "New"
    end

    fill_in "Name", with: meal.name
    fill_in "Number of Calories", with: meal.number_of_calories
    click_button "Create"

    # Index / Show
    within "ul.list-group" do
      expect(find("li .meal_name")).to have_content meal.name
      expect(find("li .meal_number_of_calories")).to have_content meal.number_of_calories
    end

    # Edit
    within(".meal_actions") do
      find(".meal_edit_action").click
    end

    new_meal = FactoryGirl.build(:meal, user: user)
    fill_in "Name", with: new_meal.name
    fill_in "Number of Calories", with: new_meal.number_of_calories
    click_button "Save"

    within "ul.list-group" do
      expect(find("li .meal_name")).to have_content new_meal.name
      expect(find("li .meal_number_of_calories")).to have_content new_meal.number_of_calories
    end

    # Delete
    within(".meal_actions") do
      find(".meal_delete_action").click
    end
    page.driver.browser.switch_to.alert.accept

    within "ul.list-group" do
      expect(page).not_to have_css("li .meal_name")
      expect(page).not_to have_css("li .meal_number_of_calories")
    end

    logout
  end

end
