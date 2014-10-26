require "rails_helper"

feature "User types in shout" do
  scenario "and submits it" do
    when_signed_in

    fill_in "Shout something!", with: "HI!"
    click_on "SHOUT!"
  end
end
