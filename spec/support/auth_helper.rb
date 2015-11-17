module AuthHelper
  def sign_in(user)
    visit root_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Login"
  end

  def logout
    if page.has_css?("#logout")
      find("#logout").click
    end
  end

end

RSpec.configure do |config|
  config.include AuthHelper
end
