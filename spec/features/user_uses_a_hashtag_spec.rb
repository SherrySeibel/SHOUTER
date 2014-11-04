require "rails_helper"

feature "User uses a hashtag in a text shout" do
  scenario "and sees the hashtag as a link" do
    when_signed_in

    fill_in "Shout something!", with: "HI! #shouter"
    click_on "SHOUT!"

    expect(page).to have_link "#SHOUTER"
  end
end
