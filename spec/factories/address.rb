FactoryGirl.define do
  Faker::Config.locale = 'en-US'

  factory :address do
    created_at Time.now
    updated_at Time.now

    name { Faker::Name.name }
    address1 { Faker::Address.street_address }
    address2 { Faker::Address.secondary_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip }
    zip_plus4 { Faker::Number.number(4) }
    country { Faker::Address.country }
  end
end
