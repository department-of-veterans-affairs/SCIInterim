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
    asia_assessment { create(:asia) }
  end
end
