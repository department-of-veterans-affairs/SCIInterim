FactoryGirl.define do
  factory :fim_measurement do
    eating { rand(1..7) }
    grooming { rand(1..7) }
    bathing { rand(1..7) }
    dressing_upper { rand(1..7) }
    dressing_lower { rand(1..7) }
    toileting { rand(1..7) }
    bladder_management { rand(1..7) }
    bowel_management { rand(1..7) }
    transfer_bed_chair_wheelchair { rand(1..7) }
    transfer_toilet { rand(1..7) }
    transfer_tub_shower { rand(1..7) }
    locomotion_walk_wheelchar { rand(1..7) }
    locomotion_stairs { rand(1..7) }
    communication_comprehension { rand(1..7) }
    communication_expression { rand(1..7) }
    social_cognition_social_interaction { rand(1..7) }
    social_cognition_problem_solving { rand(1..7) }
    social_cognition_memory { rand(1..7) }
  end
end
