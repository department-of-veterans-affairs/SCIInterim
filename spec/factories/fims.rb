FactoryGirl.define do
  factory :fim do
    is_active_duty { [true, false].sample }
    is_program_interrupted { [true, false].sample }
    measurements_start { create(:fim_measurement) } 
    measurements_goal { create(:fim_measurement) } 
    measurements_finish { create(:fim_measurement) } 
    measurements_90day { create(:fim_measurement) } 
    measurements_1year { create(:fim_measurement) } 
    impairment_category { Fim.collections[:impairment_category].sample }
    impairment_group { Fim.collections[:impairment_group].sample }
    admission_class { Fim.collections[:admission_class].sample }
    locomotion_type { Fim.collections[:locomotion_type].sample }
    communication_comprehension_type { Fim.collections[:communication_comprehension_type].sample }
    communication_expression_type { Fim.collections[:communication_expression_type].sample }
  end
end
