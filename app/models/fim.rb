class Fim < ActiveRecord::Base
  include AttributeExportable, ModelNestable

  add_nested_model [:measurements_start, :measurements_goal, :measurements_finish,
                    :measurements_90day, :measurements_1year], 'FimMeasurement'

  belongs_to :impairment_category, class_name: Domain::FimImpairmentCategory
  belongs_to :impairment_group, class_name: Domain::FimImpairmentGroup
  belongs_to :admission_class, class_name: Domain::FimAdmissionClass
  belongs_to :locomotion_type, class_name: Domain::FimLocomotionType
  belongs_to :communication_comprehension_type, class_name: Domain::FimCommunicationComprehensionType
  belongs_to :communication_expression_type, class_name: Domain::FimCommunicationExpressionType
end
