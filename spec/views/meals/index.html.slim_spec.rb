require 'rails_helper'

RSpec.describe "meals/index", type: :view do
  before(:each) do
    assign(:meals, [
      Meal.create!(
        :user => nil,
        :name => "MyText",
        :number_of_calories => 1
      ),
      Meal.create!(
        :user => nil,
        :name => "MyText",
        :number_of_calories => 1
      )
    ])
  end

  it "renders a list of meals" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
