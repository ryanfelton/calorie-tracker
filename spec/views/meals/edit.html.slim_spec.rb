require 'rails_helper'

RSpec.describe "meals/edit", type: :view do
  before(:each) do
    @meal = assign(:meal, Meal.create!(
      :user => nil,
      :name => "MyText",
      :number_of_calories => 1
    ))
  end

  it "renders the edit meal form" do
    render

    assert_select "form[action=?][method=?]", meal_path(@meal), "post" do

      assert_select "input#meal_user_id[name=?]", "meal[user_id]"

      assert_select "textarea#meal_name[name=?]", "meal[name]"

      assert_select "input#meal_number_of_calories[name=?]", "meal[number_of_calories]"
    end
  end
end
