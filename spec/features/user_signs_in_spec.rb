require "rails_helper"

feature "User signs in" do
  scenario "with valid email and password" do
    user = create(:user)

    sign_in(user)

    expect(page).to have_content "You are currently signed in"
  end

  scenario "with invalid credetials" do
    user = create(:user)

    visit root_path
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    click_on "Sign in"

    expect(page).to have_content "Invalid username or password"
  end
end
