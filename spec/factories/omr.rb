FactoryGirl.define do
  Faker::Config.locale = 'en-US'

  factory :omr do
    sequence(:patient_id)

    episode_date { Faker::Date.between(100.years.ago, Date.today) }
    omb_completed { Faker::Date.between(100.years.ago, Date.today) }
    admission_date { Faker::Date.between(100.years.ago, Date.today) }

    created_at Time.now
    updated_at Time.now

    start_asia { rand(10) }
    start_fim { rand(18..126) }
    start_fam { rand(18..126) }
    start_chart_sf { rand(18..126) }

    start_swls { rand(5..35) }
    goal_fim { rand(18..126) }
    goal_fam { rand(18..126) }

    finish_asia { rand(10) }
    finish_fim { rand(18..126) }
    finish_fam { rand(18..126) }
    finish_chart_sf { rand(18..126) }
    finish_swls { rand(5..35) }
    finish_uspeq { Faker::Lorem.word }

    discharge_location { Faker::Lorem.sentence(3) }

    # t.string   "start_sf_8"
    # t.string   "finish_sf_8"
    # t.string   "dusoi"

  end
end
