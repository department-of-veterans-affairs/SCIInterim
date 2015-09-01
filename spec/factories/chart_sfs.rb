FactoryGirl.define do
  factory :chart_sf do
    q1a_hours_paid { rand(0..24) }
    q1b_hours_unpaid { rand(0..24) }
    q2_at_home_assisted_cognitive { Domain::ChartSfAtHomeCognitive.all.sample }
    q3_not_home_assisted_cognitive { Domain::ChartSfNotHomeCognitive.all.sample }
    q4_hours_out_of_bed_per_day { rand(0..24) }
    q5_days_out_of_house_per_week { rand(0..7) }
    q6_nights_not_home_per_year { Domain::ChartSfAwayNight.all.sample }
    q7a_hours_paid_for_job_per_week { rand(0..112) }
    q7b_occupation { Faker::Lorem.sentence(1, false, 3) }
    q8_hours_in_school_per_week { rand(0..112) }
    q9_hours_homemaking_per_week { rand(0..112) }
    q10_hours_in_home_maintenance_per_week { rand(0..112) }
    q11_hours_in_recreation_per_week { rand(0..112) }
    q12_num_people_cohabiting { rand(0..112) }
    q13_living_with_spouse { Domain::ChartSfSpouseResidentOption.all.sample }
    q14_num_relatives_cohabiting { rand(0..112) }
    q15_num_associates_visited_per_month { rand(0..112) }
    q16_num_friends_visited_per_month { rand(0..112) }  
    q17_num_initiated_stranger_conversations_per_month { Domain::ChartSfInitiatedStrangerConversation.all.sample }
    q18_household_combined_income { Domain::ChartSfHouseholdIncome.all.sample }
    q19_total_medical_expenses_last_year { Domain::ChartSfMedicalExpense.all.sample } 
  end
end
