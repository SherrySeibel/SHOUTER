require "rails_helper"

feature "User visits new session page" do
  scenario "succcessfully" do
    visit new_session_path

    expect(page).to have_field "Email"
    expect(page).to have_field "Password"
  end
end
