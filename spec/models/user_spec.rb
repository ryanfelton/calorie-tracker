require 'rails_helper'

RSpec.describe User, type: :model do

  it { is_expected.to have_many :meals }

  it { is_expected.to validate_presence_of(:email) }

  it { expect(FactoryGirl.create(:user)).to be_valid }

end
