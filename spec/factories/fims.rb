FactoryGirl.define do
  factory :fim do
    is_active_duty { [true, false].sample }
    is_program_interrupted { [true, false].sample }
    measurements_start { create(:fim_measurement) } 
    measurements_goal { create(:fim_measurement) } 
    measurements_finish { create(:fim_measurement) } 
    measurements_90day { create(:fim_measurement) } 
    measurements_1year { create(:fim_measurement) } 
    impairment_category { Domain::FimImpairmentCategory.all.sample }
    impairment_group { Domain::FimImpairmentGroup.all.sample }
    admission_class { Domain::FimAdmissionClass.all.sample }
    locomotion_type { Domain::FimLocomotionType.all.sample }
    communication_comprehension_type { Domain::FimCommunicationComprehensionType.all.sample }
    communication_expression_type { Domain::FimCommunicationExpressionType.all.sample }
  end
end
