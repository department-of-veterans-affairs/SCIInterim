FactoryGirl.define do
  factory :sf8 do
    q1_overall_health { rand(1..6) }
    q2a_physical_activities_limited_by_physical { rand(1..5) }
    q2b_physical_activities_limited_by_physical_mobility_restricted { rand(1..5) }
    q3_occupational_difficulty_by_physical_health { rand(1..5) }
    q4_bodily_pain { rand(1..6) }
    q5_energy { rand(1..5) }
    q6_social_activities_limited_by_physical_or_emotional { rand(1..5) }
    q7_emotional_problems { rand(1..5) }
    q8_activities_limited_by_personal_or_emotional_problems { rand(1..5) }
  end
end
