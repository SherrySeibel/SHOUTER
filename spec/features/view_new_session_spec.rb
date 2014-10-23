require "rails_helper"

feature "User visits new session page" do
  scenario "succcessfully" do
    visit session_path

    expect(page).to have_css "h1", text: "SHOUTER"
  end
end
