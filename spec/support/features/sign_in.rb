module Features
  def sign_in
    sign_in_as "person@example.com"
  end
end

def sign_in_as(email)
  visit session_path
  fill_in "Email", with: email
  fill_in "Password", with: password
  click_on "Sign in"
end
