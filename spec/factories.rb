FactoryGirl.define do  factory :shout do
    body "MyString"
user nil
  end

  factory :user do
    sequence(:email) { |n| "someone#{n}@example.com" }
    sequence(:username) { |n| "someone#{n}" }
    password_digest "password"
  end
end
