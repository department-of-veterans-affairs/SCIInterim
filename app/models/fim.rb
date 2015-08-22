class Fim < ActiveRecord::Base
  belongs_to :measurements_start, class_name: "FimMeasurement", foreign_key: :measurements_start_id
  accepts_nested_attributes_for :measurements_start
  validates_associated :measurements_start

  belongs_to :measurements_goal, class_name: "FimMeasurement", foreign_key: :measurements_goal_id
  accepts_nested_attributes_for :measurements_goal
  validates_associated :measurements_goal

  belongs_to :measurements_finish, class_name: "FimMeasurement", foreign_key: :measurements_finish_id
  accepts_nested_attributes_for :measurements_finish
  validates_associated :measurements_finish

  belongs_to :measurements_90day, class_name: "FimMeasurement", foreign_key: :measurements_90day_id
  accepts_nested_attributes_for :measurements_90day
  validates_associated :measurements_90day

  belongs_to :measurements_1year, class_name: "FimMeasurement", foreign_key: :measurements_1year_id
  accepts_nested_attributes_for :measurements_1year
  validates_associated :measurements_1year

  def self.collections
    {
      "impairment_category" => Domain::FimImpairmentCategory.collection,
      "impairment_group" => Domain::FimImpairmentGroup.collection,
      "admission_class" => Domain::FimAdmissionClass.collection,
      "locomotion_type" => Domain::FimLocomotionType.collection,
      "communication_comprehension_type" => Domain::FimCommunicationComprehensionType.collection,
      "communication_expression_type" => Domain::FimCommunicationExpressionType.collection,
    }.with_indifferent_access
  end
end
