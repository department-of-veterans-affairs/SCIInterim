FactoryGirl.define do
  factory :asia do
    classification { Asia.classifications.keys.sample }
    is_complete false
    has_motor_or_sensory_asymmetry true
    neurological_sensory_level_left { Asia.level_of_injuries.keys.sample }
    neurological_sensory_level_right { Asia.level_of_injuries.keys.sample }
    neurological_motor_level_left { Asia.level_of_injuries.keys.sample }
    neurological_motor_level_right { Asia.level_of_injuries.keys.sample }
    preservation_sensory_left { Asia.level_of_injuries.keys.sample }
    preservation_sensory_right { Asia.level_of_injuries.keys.sample }
    preservation_motor_left { Asia.level_of_injuries.keys.sample }
    preservation_motor_right { Asia.level_of_injuries.keys.sample }
  end

end
