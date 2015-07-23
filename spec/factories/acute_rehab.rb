FactoryGirl.define do
  Faker::Config.locale = 'en-US'

  factory :acute_rehab do
    created_at Time.now
    updated_at Time.now

    start_asia_assessment { create(:asia) }
    start_fim { rand(18..126) }
    start_swls { rand(5..35) }
    start_sf8 { rand(5..35) }
    goal_fim { rand(18..126) }
    finish_asia_assessment { create(:asia) }
    finish_fim { rand(18..126) }
    finish_swls { rand(5..35) }
    finish_sf8 { rand(5..35) }
    reason_for_admission { AcuteRehab.reason_for_admissions.keys.sample }
    reason_for_admission_other { Faker::Lorem.sentence(3, false, 10) }
    hospital_admission { Faker::Date.between(20.years.ago, Date.today) }
    acute_rehab_admission { Faker::Date.between(20.years.ago, Date.today) }
    acute_rehab_discharge { Faker::Date.between(20.years.ago, Date.today) }
    hospital_discharge { Faker::Date.between(20.years.ago, Date.today) }
    residence_type { AcuteRehab.residence_types.keys.sample }
    residence_name { Faker::Company.name }
    discharge_to_community { [true, false].sample }
    followup_90day_date { Faker::Date.between(20.years.ago, Date.today) }
    followup_90day_fim { rand(18..126) }
    followup_90day_swls { rand(5..35) }
    followup_90day_chart_sf { rand(5..35) }
    followup_90day_sf8 { rand(5..35) }
    followup_1yr_date { Faker::Date.between(20.years.ago, Date.today) }
    followup_1yr_fim { rand(18..126) }
    followup_1yr_swls { rand(5..35) }
    followup_1yr_chart_sf { rand(5..35) }
    followup_1yr_sf8 { rand(5..35) }
  end
end
