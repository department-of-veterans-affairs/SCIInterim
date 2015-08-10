FactoryGirl.define do
  Faker::Config.locale = 'en-US'

  factory :omr do
    created_at Time.now
    updated_at Time.now

    start_asia { 'BAD SETUP' }
    start_fim { rand(18..126) }
    start_fam { rand(18..126) }
    start_swls { rand(5..35) }
    start_chart_sf { rand(5..35) }
    start_sf_8 { rand(5..35) }
    dusoi "bye"
    goal_fim { rand(18..126) }
    goal_fam { rand(18..126) }
    omb_completed { Faker::Date.between(20.years.ago, Date.today) }
    finish_asia { 'BAD SETUP' }
    finish_fim { rand(18..126) }
    finish_fam { rand(18..126) }
    finish_swls { rand(5..35) }
    finish_chart_sf { rand(5..35) }
    finish_sf_8 { rand(5..35) }
    discharge_location "hi"
  end
end

