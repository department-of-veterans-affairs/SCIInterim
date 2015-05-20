FactoryGirl.define do
  Faker::Config.locale = 'en-US'

  factory :episode_of_cares do
    patient_id 3
    actable_id 123
    actable_type 'actable type'
    episode_date { Faker::Date.between(100.years.ago, Date.today) }
    created_at Time.now
    updated_at Time.now
  end
end
