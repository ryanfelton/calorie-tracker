
require 'rails_helper'

RSpec.describe Meal, type: :model do

  it { is_expected.to belong_to :user }

  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:number_of_calories) }
  it { is_expected.to validate_presence_of(:consumed_at) }

  # it { is_expected.to validate_numericality_of(:number_of_calories).only_integer }
end
