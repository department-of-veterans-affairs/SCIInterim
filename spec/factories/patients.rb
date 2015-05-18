FactoryGirl.define do
  Faker::Config.locale = 'en-US'

  factory :patient do
    patient_id 1
    name { Faker::Name.name }
    ssn "123-45-6789"
    dob { Faker::Date.between(100.years.ago, Date.today) }
    created_at Time.now
    updated_at Time.now
    sci_region "LB"
    asia_level 2
  end
end
