class FimMeasurement < ActiveRecord::Base
  validates :eating, numericality: { greater_than: 0, less_than: 8 }
  validates :grooming, numericality: { greater_than: 0, less_than: 8 }
  validates :bathing, numericality: { greater_than: 0, less_than: 8 }
  validates :dressing_upper, numericality: { greater_than: 0, less_than: 8 }
  validates :dressing_lower, numericality: { greater_than: 0, less_than: 8 }
  validates :toileting, numericality: { greater_than: 0, less_than: 8 }
  validates :bladder_management, numericality: { greater_than: 0, less_than: 8 }
  validates :bowel_management, numericality: { greater_than: 0, less_than: 8 }
  validates :transfer_bed_chair_wheelchair, numericality: { greater_than: 0, less_than: 8 }
  validates :transfer_toilet, numericality: { greater_than: 0, less_than: 8 }
  validates :transfer_tub_shower, numericality: { greater_than: 0, less_than: 8 }
  validates :locomotion_walk_wheelchar, numericality: { greater_than: 0, less_than: 8 }
  validates :locomotion_stairs, numericality: { greater_than: 0, less_than: 8 }
  validates :communication_comprehension, numericality: { greater_than: 0, less_than: 8 }
  validates :communication_expression, numericality: { greater_than: 0, less_than: 8 }
  validates :social_cognition_social_interaction, numericality: { greater_than: 0, less_than: 8 }
  validates :social_cognition_problem_solving, numericality: { greater_than: 0, less_than: 8 }
  validates :social_cognition_memory, numericality: { greater_than: 0, less_than: 8 }
end
