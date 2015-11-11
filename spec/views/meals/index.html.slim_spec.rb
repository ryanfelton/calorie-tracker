require 'rails_helper'

RSpec.describe "meals/index", type: :view do
  let(:meals) {
    [
      FactoryGirl.create(:meal),
      FactoryGirl.create(:meal)
    ]
  }

  before(:each) do
    assign(:meals, meals)
  end

  it "renders a list of meals" do
    render
    # assert_select "tr>td", :text => meals.first.name.to_s
    # assert_select "tr>td", :text => meals.first.number_of_calories

    # assert_select "tr>td", :text => meals.second.name
    # assert_select "tr>td", :text => meals.second.number_of_calories
  end
end
