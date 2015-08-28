FactoryGirl.define do
  factory :asia do
    classification { Asia.collections[:classification].sample }
    is_complete false
    has_motor_or_sensory_asymmetry true
    neurological_sensory_level_left { Asia.collections[:neurological_sensory_level_left].sample }
    neurological_sensory_level_right { Asia.collections[:neurological_sensory_level_right].sample }
    neurological_motor_level_left { Asia.collections[:neurological_motor_level_left].sample }
    neurological_motor_level_right { Asia.collections[:neurological_motor_level_right].sample }
    preservation_sensory_level_left { Asia.collections[:preservation_sensory_level_left].sample }
    preservation_sensory_level_right { Asia.collections[:preservation_sensory_level_right].sample }
    preservation_motor_level_left { Asia.collections[:preservation_motor_level_left].sample }
    preservation_motor_level_right { Asia.collections[:preservation_motor_level_right].sample }
  end

end
