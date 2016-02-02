FactoryGirl.define do
  factory :asia do
    impairment_scale { Domain::AsiaClassification.all.sample }
    
    has_motor_or_sensory_asymmetry { impairment_scale.name.downcase != "e" }
    neurological_sensory_level_left { impairment_scale.name.downcase != "e" ? Domain::LevelOfInjury.all.sample : Domain::LevelOfInjury.first }
    neurological_sensory_level_right { impairment_scale.name.downcase != "e" ? Domain::LevelOfInjury.all.sample : Domain::LevelOfInjury.first }
    neurological_motor_level_left { impairment_scale.name.downcase != "e" ? Domain::LevelOfInjury.all.sample : Domain::LevelOfInjury.first }
    neurological_motor_level_right { impairment_scale.name.downcase != "e" ? Domain::LevelOfInjury.all.sample : Domain::LevelOfInjury.first }
    preservation_sensory_level_left { impairment_scale.name.downcase != "e" ? Domain::LevelOfInjury.all.sample : Domain::LevelOfInjury.first }
    preservation_sensory_level_right { impairment_scale.name.downcase != "e" ? Domain::LevelOfInjury.all.sample : Domain::LevelOfInjury.first }
    preservation_motor_level_left { impairment_scale.name.downcase != "e" ? Domain::LevelOfInjury.all.sample : Domain::LevelOfInjury.first }
    preservation_motor_level_right { impairment_scale.name.downcase != "e" ? Domain::LevelOfInjury.all.sample : Domain::LevelOfInjury.first }
  end
end
