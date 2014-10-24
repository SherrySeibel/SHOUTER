require "rails_helper"

feature "User signs out" do
  scenario "and is redirected to landing page" do
    user = create(:user)

    sign_in(user)

    visit homes_path

    click_on "Sign out?"

    expect(page).to have_content "Don't have an account?"
  end
end
