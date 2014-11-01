require "rails_helper"

feature "User interacts with a text shout" do
  before :each do
    when_signed_in

    fill_in "Shout something!", with: "HI!"
    click_on "SHOUT!"
  end

  scenario "and clicks on time of creation" do
    text_shout = create(:text_shout)

    click_on "less than a minute"

    expect(page).to have_content "HI!"
  end

  scenario "and clicks on a username" do
    text_shout = create(:text_shout)

    click_on User.first.username

    expect(page).to have_css "h2", text: User.first.username
    expect(page).to have_content "HI!"
  end
end
