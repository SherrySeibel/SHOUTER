require "rails_helper"

feature "User signs in" do
  scenario "with valid email and password" do
    user = create(:user)

    sign_in(user)

    expect(page).to have_content "You are currently signed in"
  end
end
