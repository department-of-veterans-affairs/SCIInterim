FactoryGirl.define do
  Faker::Config.locale = 'en-US'

  factory :patient do
    sequence(:id)
    sequence(:patient_id)

    name { Faker::Name.name }
    ssn "123-45-6789"
    dob { Faker::Date.between(80.years.ago, 18.years.ago) }
    created_at Time.now
    updated_at Time.now
    sci_region "LB"
    asia_level { Faker::Number.between(0,27) }

    employment_status { [ :Employed, :Unemployed ].sample }
    registration_status [ :"Currently Served", :"Not Served" ].sample
    date_of_death { [Faker::Date.between(dob+20.years, Time.new), nil, nil, nil].sample }
    sci_network [true, false].sample
    outcome_coordinator Faker::Name.name
    highest_level_of_education [ :"No Diploma", :"High School", :"Some College", :"Graduate School" ].sample

  end
end
