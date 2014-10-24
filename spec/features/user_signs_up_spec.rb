require "rails_helper"

feature "User signs up" do
  scenario "with valid email, username, and password" do
    sign_up

    expect(page).to have_content "Sign out?"
  end

  scenario "with invalid fields" do
    visit new_user_path

    click_on "Sign up"

    expect(page).to have_content "prevented the form from submitting:"
  end

  def sign_up
    sign_up_as "someone@example.com", "someone", "password"
  end

  def sign_up_as(email, username,  password)
    visit new_user_path
    fill_in "Email", with: email
    fill_in "Username", with: username
    fill_in "Password", with: password
    click_on "Sign up"
  end
end
