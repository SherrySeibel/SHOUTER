require "rails_helper"

feature "User submits a text shout" do
  before :each do
    when_signed_in
  end

  scenario "with content" do
    fill_in "Shout something!", with: "HI!"
    click_on "SHOUT!"

    expect(page).to have_content "HI!"
    expect(page).to have_css ".shout, #shout_1"
  end

  scenario "without content and sees a flash notice" do
    fill_in "Shout something!", with: ""
    click_on "SHOUT!"

    expect(page).to have_content "Nothing was shouted"
  end
end
