require "rails_helper"

feature "User uses a hashtag in a text shout" do
  scenario "and sees the hashtag as a link" do
    when_signed_in

    fill_in "Shout something!", with: "HI! #shouter"
    click_on "SHOUT!"
    click_on "#SHOUTER"

    expect(page).to have_css "h1", text: "SHOUTER"
    expect(page).to have_content "HI! #SHOUTER"
    expect(page).to have_link "less than a minute"
    expect(page).to have_link User.first.username
  end
end
