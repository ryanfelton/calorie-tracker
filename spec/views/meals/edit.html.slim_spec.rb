require 'rails_helper'

RSpec.describe "meals/edit", type: :view do
  let(:meal) { FactoryGirl.create(:meal) }

  before(:each) do
    @meal = meal
  end

  it "renders the edit meal form" do
    render

    assert_select "form[action=?][method=?]", meal_path(meal), "post" do
      assert_select "textarea#meal_name[name=?]", "meal[name]"
      assert_select "input#meal_number_of_calories[name=?]", "meal[number_of_calories]"
    end
  end
end
