FactoryGirl.define do
  Faker::Config.locale = 'en-US'

  factory :omr90_day do
    sequence(:patient_id)

    episode_date { Faker::Date.between(100.years.ago, Date.today) }
    followup_date { Faker::Date.between(100.years.ago, Date.today) }

    created_at Time.now
    updated_at Time.now

    fim { rand(18..126) }
    fam { rand(18..126) }
    swls { rand(5..35) }
    chart_sf { rand(18..126) }
    sf_8 { rand(18..126) }

    place_of_residence { Faker::Lorem.sentence(3) }

    end
end
