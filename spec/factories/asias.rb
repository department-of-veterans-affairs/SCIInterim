FactoryGirl.define do
  factory :asia do
    impairment_scale { Domain::AsiaClassification.all.sample }
    is_complete { [true, false].sample }
    has_motor_or_sensory_asymmetry true
    neurological_sensory_level_left { Domain::LevelOfInjury.all.sample }
    neurological_sensory_level_right { Domain::LevelOfInjury.all.sample }
    neurological_motor_level_left { Domain::LevelOfInjury.all.sample }
    neurological_motor_level_right { Domain::LevelOfInjury.all.sample }
    preservation_sensory_level_left { Domain::LevelOfInjury.all.sample }
    preservation_sensory_level_right { Domain::LevelOfInjury.all.sample }
    preservation_motor_level_left { Domain::LevelOfInjury.all.sample }
    preservation_motor_level_right { Domain::LevelOfInjury.all.sample }
  end

end
