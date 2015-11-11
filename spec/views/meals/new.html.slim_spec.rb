require 'rails_helper'

RSpec.describe "meals/new", type: :view do
  before(:each) do
    assign(:meal, Meal.new(
      :user => nil,
      :name => "MyText",
      :number_of_calories => 1
    ))
  end

  it "renders new meal form" do
    render

    assert_select "form[action=?][method=?]", meals_path, "post" do

      assert_select "input#meal_user_id[name=?]", "meal[user_id]"

      assert_select "textarea#meal_name[name=?]", "meal[name]"

      assert_select "input#meal_number_of_calories[name=?]", "meal[number_of_calories]"
    end
  end
end
