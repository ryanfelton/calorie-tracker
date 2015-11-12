require 'rails_helper'

RSpec.describe User, type: :model do

  it { is_expected.to have_many :meals }

  it { is_expected.to validate_presence_of(:email) }

  it { expect(FactoryGirl.create(:user)).to be_valid }

  describe "#meals" do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:user2) { FactoryGirl.create(:user) }
    let!(:admin) { FactoryGirl.create(:admin) }

    let!(:meal1) { FactoryGirl.create(:meal, user: user) }
    let!(:meal2) { FactoryGirl.create(:meal, user: user2) }

    describe "user" do
      it "is expected to have only one meal" do
        expect(user.meals.count).to eq 1
        expect(user.meals).to include(meal1)
        expect(user.meals).not_to include(meal2)
      end
    end

    describe "admin" do
      it "is expected to have only one meal" do
        expect(admin.meals.count).to eq 2
        expect(admin.meals).to include(meal1)
        expect(admin.meals).to include(meal2)
      end
    end

  end
end
