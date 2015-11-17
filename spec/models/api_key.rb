require 'rails_helper'

RSpec.describe User, type: :model do

  describe "#generate_api_key" do
    let!(:api_key) { FactoryGirl.build(:api_key) }
    it "is expected to have only one meal" do
      expect(api_key.api_key).to be_blank
      api_key.validate
      expect(api_key.api_key).to be_present
    end

  end
end
