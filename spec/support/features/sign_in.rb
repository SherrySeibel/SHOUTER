module Features
  def sign_in(user)
    visit root_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_on "Sign in"
  end

  def when_signed_in
    user = create(:user)

    sign_in(user)

    visit homes_path
  end
end
