require "rails_helper"

feature "User signs out" do
  scenario "and is redirected to landing page" do
    when_signed_in

    click_on "Sign out?"

    expect(page).to have_content "Don't have an account?"
  end
end
