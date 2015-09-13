class FimMeasurement < ActiveRecord::Base
  include AttributeExportable

  validates :eating, numericality: { greater_than: 0, less_than: 8, allow_blank: true }
  validates :grooming, numericality: { greater_than: 0, less_than: 8, allow_blank: true }
  validates :bathing, numericality: { greater_than: 0, less_than: 8, allow_blank: true }
  validates :dressing_upper, numericality: { greater_than: 0, less_than: 8, allow_blank: true }
  validates :dressing_lower, numericality: { greater_than: 0, less_than: 8, allow_blank: true }
  validates :toileting, numericality: { greater_than: 0, less_than: 8, allow_blank: true }
  validates :bladder_management, numericality: { greater_than: 0, less_than: 8, allow_blank: true }
  validates :bowel_management, numericality: { greater_than: 0, less_than: 8, allow_blank: true }
  validates :transfer_bed_chair_wheelchair, numericality: { greater_than: 0, less_than: 8, allow_blank: true }
  validates :transfer_toilet, numericality: { greater_than: 0, less_than: 8, allow_blank: true }
  validates :transfer_tub_shower, numericality: { greater_than: 0, less_than: 8, allow_blank: true }
  validates :locomotion_walk_wheelchar, numericality: { greater_than: 0, less_than: 8, allow_blank: true }
  validates :locomotion_stairs, numericality: { greater_than: 0, less_than: 8, allow_blank: true }
  validates :communication_comprehension, numericality: { greater_than: 0, less_than: 8, allow_blank: true }
  validates :communication_expression, numericality: { greater_than: 0, less_than: 8, allow_blank: true }
  validates :social_cognition_social_interaction, numericality: { greater_than: 0, less_than: 8, allow_blank: true }
  validates :social_cognition_problem_solving, numericality: { greater_than: 0, less_than: 8, allow_blank: true }
  validates :social_cognition_memory, numericality: { greater_than: 0, less_than: 8, allow_blank: true }
end
