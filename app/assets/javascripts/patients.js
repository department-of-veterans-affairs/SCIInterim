// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  showWhenValueEquals("[name='patient[travel_status_id]']", 4, "#benefitsOther");
  showWhenValueEquals("[name='patient[scid_eligibility_id]']", 1, "#sciDetails");
  showWhenValueEquals("[name='patient[scid_eligibility_id]']", 2, "#sciMs");
  showWhenValueEquals("[name='patient[scid_eligibility_id]']", 4, "#sciOther");
  showWhenValueEquals("[name='patient[is_receiving_non_va_care]']", "true", "#bowelBladderDetails");
  showWhenValueEquals("[name='patient[principle_pcp_va_nonva_id]']", 1, "#principleVa");
  showWhenValueEquals("[name='patient[principle_pcp_va_nonva_id]']", 2, "#principleNonVa");
  showWhenValueEquals("[name='patient[va_status_id]']", 4, "#expiredDate");
  showWhenValueEquals("[name='patient[change_in_asia]']", "Yes", "#incsci_new_asia")

  toggleLabel("#isncsci_left_motor_lbl", "Left Motor", "Motor", 
     "#isncsci [name='patient[asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#isncsci_left_sensory_lbl", "Left Sensory", "Sensory", 
     "#isncsci [name='patient[asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#isncsci_zpp_left_motor_lbl", "Left Motor", "Motor", 
     "#isncsci [name='patient[asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#isncsci_zpp_left_sensory_lbl", "Left Sensory", "Sensory", 
     "#isncsci [name='patient[asia_attributes][has_motor_or_sensory_asymmetry]']");  

  showWhenValueEquals("[name='patient[asia_attributes][has_motor_or_sensory_asymmetry]']", "true", "#isncsci_asymmetrical");
  showWhenValueEquals("[name='patient[asia_attributes][impairment_scale_id]']", 1, "#isncsci_zone_of_partial_preservation");
  showWhenValueEquals("[name='patient[asia_attributes][has_motor_or_sensory_asymmetry]']", "true", "#isncsci_zpp_asymmetrical");

  changeOptionWhenValueEquals("[name='patient[asia_attributes][neurological_motor_level_left_id]']", 
    "[name='patient[asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='patient[asia_attributes][neurological_sensory_level_left_id]']", 
    "[name='patient[asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='patient[asia_attributes][neurological_motor_level_right_id]']", 
    "[name='patient[asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='patient[asia_attributes][neurological_sensory_level_right_id]']", 
    "[name='patient[asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='patient[asia_attributes][preservation_motor_level_left_id]']", 
    "[name='patient[asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='patient[asia_attributes][preservation_sensory_level_left_id]']", 
    "[name='patient[asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='patient[asia_attributes][preservation_motor_level_right_id]']", 
    "[name='patient[asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='patient[asia_attributes][preservation_sensory_level_right_id]']", 
    "[name='patient[asia_attributes][impairment_scale_id]']", 5, 1);  

  changeOptionWhenValueEquals("[name='patient[asia_attributes][has_motor_or_sensory_asymmetry]']", 
    "[name='patient[asia_attributes][impairment_scale_id]']", 5, false);
});
