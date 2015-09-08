FactoryGirl.define do
  Faker::Config.locale = 'en-US'

  factory :omr do
    created_at Time.now
    updated_at Time.now

    discharge_location { Domain::ResidenceType.all.sample }
    finish_chart_sf { create(:chart_sf) }
    finish_date { Faker::Date.between(20.years.ago, Date.today) }
    finish_fim { create(:fim) }
    finish_sf8 { create(:sf8) }
    finish_swls { rand(5..35) }
    followup_1yr_chart_sf { create(:chart_sf) }
    followup_1yr_date { Faker::Date.between(20.years.ago, Date.today) }
    followup_1yr_fim { create(:fim) }
    followup_1yr_sf8 { create(:sf8) }
    followup_90day_chart_sf { create(:chart_sf) }
    followup_90day_date { Faker::Date.between(20.years.ago, Date.today) }
    followup_90day_fim { create(:fim) }
    followup_90day_sf8 { create(:sf8) }
    goal_fim { create(:fim) }
    start_asia { create(:asia) }
    start_chart_sf { create(:chart_sf) }
    start_date { Faker::Date.between(20.years.ago, Date.today) }
    start_fim { create(:fim) }
    start_sf8 { create(:sf8) }
    start_swls { rand(5..35) }
  end
end

