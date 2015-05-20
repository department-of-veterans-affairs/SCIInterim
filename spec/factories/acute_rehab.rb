FactoryGirl.define do
  Faker::Config.locale = 'en-US'

  factory :acute_rehab do
    episode_date { Faker::Date.between(100.years.ago, Date.today) }
    admission_date { Faker::Date.between(100.years.ago, Date.today) }

    created_at Time.now
    updated_at Time.now

    start_asia { rand(10) }
    start_fim { rand(18..126) }
    start_swls { rand(5..35) }
    start_kurtzke_edss { rand(1.0..10.0) }
    goal_fim { rand(18..126) }
    accute_rehab_completed { admission_date + rand(10) }
    finish_asia { rand(10) }
    finish_fim { rand(18..126) }
    finish_kurtzke_edss { rand(1.0..10.0) }
    finish_uspeq { Faker::Lorem.word }
    discharge_location { Faker::Lorem.sentence(3) }
  end
end
