require 'rails_helper'

RSpec.describe "meals/show", type: :view do
  let(:meal) { FactoryGirl.create(:meal) }

  before(:each) do
    @meal = assign(:meal, meal)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/#{meal.user.email}/)
    expect(rendered).to match(/#{meal.name}/)
    expect(rendered).to match(/#{meal.number_of_calories}/)
  end
end
