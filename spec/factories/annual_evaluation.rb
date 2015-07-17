FactoryGirl.define do
  Faker::Config.locale = 'en-US'

  factory :annual_evaluation do
    episode_date { Faker::Date.between(100.years.ago, Date.today) }

    created_at Time.now
    updated_at Time.now

    eval_offered { Faker::Date.between(100.years.ago, Date.today) } 
    eval_completed { Faker::Date.between(100.years.ago, Date.today) } 
    is_inpatient { [true, false].sample }
    bmi { rand(32.0) }
    cyh { Faker::Lorem.word }
    fim { rand(18..126) }
    kurtzke_edss { Faker::Lorem.word }
    bladder_drainage_method { AnnualEvaluation.bladder_drainage_methods.keys.sample }
    has_motor_or_sensory_asymmetry { [true, false].sample }
    neuro_zone_of_preservation1 { 1 }
    neuro_zone_of_preservation2 { 2 }
    neuro_zone_of_preservation3 { 3 }
    level_of_injury { 4 }
    asia_score { 1 }
  end
end
