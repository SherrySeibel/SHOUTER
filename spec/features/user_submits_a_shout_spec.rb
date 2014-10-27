require "rails_helper"

feature "User submits a valid shout" do
  before :each do
    when_signed_in

    fill_in "Shout something!", with: "HI!"
    click_on "SHOUT!"
  end

  scenario "and sees it on the homepage" do
    expect(page).to have_content "HI!"
    expect(page).to have_css ".shout, #shout_1"
  end

  scenario "and clicks on time of creation" do
    shout = create(:shout)

    click_on "less than a minute"

    expect(page).to have_content "HI!"
  end

  scenario "and clicks on a username" do
    shout = create(:shout, user: User.first)

    click_on shout.user.username

    expect(page).to have_css "h2", text: User.first.username
    expect(page).to have_content "HI!"
  end
end

feature "User submmits an invalid shout" do
  scenario "and sees a flash notice" do
  when_signed_in

  fill_in "Shout something!", with: ""
  click_on "SHOUT!"

  expect(page).to have_content "Nothing was shouted"
  end
end
