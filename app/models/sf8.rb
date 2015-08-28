class Sf8 < ActiveRecord::Base
  validates :q1_overall_health, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 6, allow_blank: true }
  validates :q2a_physical_activities_limited_by_physical, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5, allow_blank: true }
  validates :q2b_physical_activities_limited_by_physical_mobility_restricted, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5, allow_blank: true }
  validates :q3_occupational_difficulty_by_physical_health, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5, allow_blank: true }
  validates :q4_bodily_pain, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 6, allow_blank: true }
  validates :q5_energy, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5, allow_blank: true }
  validates :q6_social_activities_limited_by_physical_or_emotional, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5, allow_blank: true }
  validates :q7_emotional_problems, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5, allow_blank: true }
  validates :q8_activities_limited_by_personal_or_emotional_problems, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5, allow_blank: true }

  def self.collections
    {
      "q1_overall_health" => [
        ["Excellent", 1],
        ["Very Good", 2],
        ["Good", 3],
        ["Fair", 4],
        ["Poor", 5],
        ["Very Poor", 5]
      ],
      "q2a_physical_activities_limited_by_physical" => [
        ["Not at All", 1],
        ["Very Little", 2],
        ["Somewhat", 3],
        ["Quite a Lot", 4],
        ["Could not do physical activities", 5]
      ],
      "q2b_physical_activities_limited_by_physical_mobility_restricted" => [
        ["Not at All", 1],
        ["Very Little", 2],
        ["Somewhat", 3],
        ["Quite a Lot", 4],
        ["Could not do physical activities", 5]
      ],
      "q3_occupational_difficulty_by_physical_health" => [
        ["None at All", 1],
        ["A little Bit", 2],
        ["Some", 3],
        ["Quite a Lot", 4],
        ["Could not do daily work", 5]
      ],
      "q4_bodily_pain" => [
        ["None", 1],
        ["Very Mild", 2],
        ["Mild", 3],
        ["Moderate", 4],
        ["Severe", 5],
        ["Very Severe", 5]
      ],
      "q5_energy" => [
        ["Very Much", 1],
        ["Quite a Lot", 2],
        ["Some", 3],
        ["A Little", 4],
        ["None", 5] 
      ],
      "q6_social_activities_limited_by_physical_or_emotional" => [
        ["Not at All", 1],
        ["Very Little", 2],
        ["Somewhat", 3],
        ["Quite a Lot", 4],
        ["Could not do social activities", 5]
      ],
      "q7_emotional_problems" => [
        ["Not at All", 1],
        ["Slightly", 2],
        ["Moderately", 3],
        ["Quite a Lot", 4],
        ["Extremely", 5]
      ],
      "q8_activities_limited_by_personal_or_emotional_problems" => [
        ["Not at All", 1],
        ["Very Little", 2],
        ["Somewhat", 3],
        ["Quite a Lot", 4],
        ["Could not do daily activities", 5]
      ],
    }.with_indifferent_access
  end
end
