class ChartSf < ActiveRecord::Base
  belongs_to :q2_at_home_assisted_cognitive, class_name: Domain::ChartSfAtHomeCognitive
  belongs_to :q3_not_home_assisted_cognitive, class_name: Domain::ChartSfNotHomeCognitive
  belongs_to :q6_nights_not_home_per_year, class_name: Domain::ChartSfAwayNight
  belongs_to :q13_living_with_spouse, class_name: Domain::ChartSfSpouseResidentOption
  belongs_to :q17_num_initiated_stranger_conversations_per_month, class_name: Domain::ChartSfInitiatedStrangerConversation
  belongs_to :q18_household_combined_income, class_name: Domain::ChartSfHouseholdIncome
  belongs_to :q19_total_medical_expenses_last_year, class_name: Domain::ChartSfMedicalExpense

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
