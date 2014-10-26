require "rails_helper"

feature "User submits a shout" do
  before :each do
    when_signed_in

    fill_in "Shout something!", with: "HI!"
    click_on "SHOUT!"
  end

  scenario "and sees it on the homepage" do
    expect(page).to have_content "HI!"
    expect(page).to have_css ".shout, #shout_1"
  end
end
