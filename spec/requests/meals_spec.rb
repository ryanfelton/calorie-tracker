require 'rails_helper'

RSpec.describe "Meals", type: :request do
  describe "GET /meals" do
    it "should require authentication" do
      get meals_path
      expect(response).to have_http_status(302)
    end

    it "should show a list of meals for an authenticated user" do
      sign_in_as_a_valid_user
      get meals_path
      expect(response).to have_http_status(200)
    end

  end
end
