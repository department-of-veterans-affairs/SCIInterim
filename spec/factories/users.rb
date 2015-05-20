FactoryGirl.define do
  Faker::Config.locale = 'en-US'

  factory :user do
    id 1
    email { Faker::Internet.email }
    password "!1aZ" * 32  # Maximum length password.
    password_confirmation "!1aZ" * 32  # Maximum length password.
  end
end
