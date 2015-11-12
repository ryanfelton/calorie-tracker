module AuthHelper
  def sign_in(user)
    visit root_path
    click_link "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end

  def sign_out
    click_link "Sign Out"
  end
end

RSpec.configure do |config|
  config.include AuthHelper
end
