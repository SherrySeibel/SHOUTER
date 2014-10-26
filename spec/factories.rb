FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "someone#{n}@example.com" }
    sequence(:username) { |n| "someone#{n}" }
    password_digest "password"
  end

  factory :shout do
    user
    body "MyString"
  end
end
