FactoryGirl.define do  factory :photo_shout do
    image ""
  end

  factory :user do
    sequence(:email) { |n| "someone#{n}@example.com" }
    sequence(:username) { |n| "someone#{n}" }
    password_digest "password"
  end

  factory :shout do
    user
  end

  factory :text_shout do
    body "shout"
  end
end
