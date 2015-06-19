FactoryGirl.define do
  Faker::Config.locale = 'en-US'

  factory :acute_rehab1_year do
    sequence(:patient_id)

    #admission_date { Faker::Date.between(100.years.ago, Date.today) }

    created_at Time.now
    updated_at Time.now

    episode_date { Faker::Date.between(80.years.ago, 18.years.ago) }
    fim { rand(18..126) }
    swls { rand(5..35) }
    chart_sf { rand(1.0..10.0) }
    sf_8 { rand(18..126) }
    place_of_residence { Faker::Lorem.sentence(3) }
  end
end
