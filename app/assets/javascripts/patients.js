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

  toggleLabel("#isncsci_left_motor_lbl", "Left Motor", "Motor", 
    "#isncsci [name='patient[asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#isncsci_left_sensory_lbl", "Left Sensory", "Sensory", 
    "#isncsci [name='patient[asia_attributes][has_motor_or_sensory_asymmetry]']", "click");  

  showWhenValueEquals("[name='patient[asia_attributes][has_motor_or_sensory_asymmetry]']", "true", "#asymmetrical");
  showWhenValueEquals("[name='patient[asia_attributes][is_complete]']", "true", "#complete");
  showWhenValueEquals("[name='acute_rehab[start_asia_attributes][has_motor_or_sensory_asymmetry]']", "false", "#asymmetry");
  showWhenValueEquals("[name='acute_rehab[start_asia_attributes][is_complete]']", "true", "#complete");
});
