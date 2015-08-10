FactoryGirl.define do
  factory :asia do
    classification { Asia.collections[:classification].sample.id }
    is_complete false
    has_motor_or_sensory_asymmetry true
    neurological_sensory_level_left { Asia.collections[:neurological_sensory_level_left].sample.id }
    neurological_sensory_level_right { Asia.collections[:neurological_sensory_level_right].sample.id }
    neurological_motor_level_left { Asia.collections[:neurological_motor_level_left].sample.id }
    neurological_motor_level_right { Asia.collections[:neurological_motor_level_right].sample.id }
    preservation_sensory_left { Asia.collections[:preservation_sensory_left].sample.id }
    preservation_sensory_right { Asia.collections[:preservation_sensory_right].sample.id }
    preservation_motor_left { Asia.collections[:preservation_motor_left].sample.id }
    preservation_motor_right { Asia.collections[:preservation_motor_right].sample.id }
  end

end
