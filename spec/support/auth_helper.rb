module AuthHelper
  def sign_in(user)
    visit root_path

    expect(page).to have_content "Login"

    click_link "Signup"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create user"

    expect(page).to have_content "User created, please login."

    # Login
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
