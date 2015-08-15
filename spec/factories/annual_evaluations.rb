FactoryGirl.define do
  Faker::Config.locale = 'en-US'

  factory :annual_evaluation do
    created_at Time.now
    updated_at Time.now

    eval_offered { Faker::Date.between(100.years.ago, Date.today) } 
    eval_completed { Faker::Date.between(100.years.ago, Date.today) } 
    is_inpatient { [true, false].sample }
    bmi { rand(32.0) }
    cyh { Faker::Lorem.word }
    fim { build_fim }
    kurtzke_edss { Faker::Lorem.word }
    bladder_drainage_method { AnnualEvaluation.collections[:bladder_drainage_method].sample.id }
    asia_assessment { create(:asia) }
  end
end
