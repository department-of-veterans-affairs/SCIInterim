FactoryGirl.define do
  Faker::Config.locale = 'en-US'

  factory :annual_evaluation do

    sequence(:patient_id)

    episode_date { Faker::Date.between(100.years.ago, Date.today) }
    #admission_date { Faker::Date.between(100.years.ago, Date.today) }

    created_at Time.now
    updated_at Time.now

    asia_level { rand(27) }


    fim { rand(18..126) }
    swls { rand(5..35) }
    kurtzke_edss { rand(1.0..10.0) }
    kurtzke_fss { rand(1.0..10.0) }

    eval_offered { Faker::Date.between(100.years.ago, Date.today) }
    eval_completed { Faker::Date.between(100.years.ago, Date.today) }
    colonoscopy_received { Faker::Date.between(100.years.ago, Date.today) }
    sigmoidoscopy_received { Faker::Date.between(100.years.ago, Date.today) }
    diabetic_retinal_screening_received { Faker::Date.between(100.years.ago, Date.today) }
    next_eval { Faker::Date.between(Time.now, Time.now + 1.year) }
    is_inpatient [true, false].sample

    # "chart_sf"
    # "cyh"
    # "dast"
    # "dusoi"
    # "dusoi_a"
    # "fam"
    # "mnfm"
    # "prime_md"
    # "push"
    # "sf_mpq"
    # "sf_8"
    # "pumt_kit"
    # "bladder_drainage_method"
    #audit
    #"bmi"
    #"cage"
    #"ces_d"


  end
end
