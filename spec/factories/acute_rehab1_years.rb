FactoryGirl.define do
  Faker::Config.locale = 'en-US'

  factory :acute_rehab1_year do
    episode_date { Faker::Date.between(100.years.ago, Date.today) }

    created_at Time.now
    updated_at Time.now
    followup_date { Faker::Date.between(100.years.ago, Date.today) }
    fim 4
    swls "swls"
    chart_sf "chart sf"
    sf_8 "sf 8"
    place_of_residence "Luna"

  end
end
