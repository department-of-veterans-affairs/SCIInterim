class ChartSf < ActiveRecord::Base

  def self.collections
    {
      :q2_at_home_assisted_cognitive => Domain::ChartSfAtHomeCognitive.collection,
      :q3_not_home_assisted_cognitive => Domain::ChartSfNotHomeCognitive.collection,
      :q6_nights_not_home_per_year => Domain::ChartSfAwayNight.collection,
      :q13_living_with_spouse => Domain::ChartSfSpouseResidentOption.collection,
      :q17_num_initiated_stranger_conversations_per_month => Domain::ChartSfInitiatedStrangerConversation.collection,
      :q18_household_combined_income => Domain::ChartSfHouseholdIncome.collection,
      :q19_total_medical_expenses_last_year => Domain::ChartSfMedicalExpense.collection,
    }.with_indifferent_access
  end
end
