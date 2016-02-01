// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
recalculateBmi = function() {
  var height_elem = $("[name='annual_evaluation[height_inches]'")[0];
  var weight_elem = $("[name='annual_evaluation[weight_lbs]'")[0];
  if (!height_inches || !weight_elem) {
    // Wrong page.
    // TODO(emilyville): This is a hack cause the JS loads on all pages.
    // How to make this only load on the Annual Evaluation page?
    return;
  }
  var height_inches = height_elem.value;
  var weight_lbs = weight_elem.value;

  // Round the input values.
  if (height_elem.value) {
    height_elem.value = height_inches = Math.round(height_inches);
  }
  if (weight_elem.value) {
    weight_elem.value = weight_lbs = Math.round(weight_lbs);
  }

  // Round to BMI to 2 digits.
  if (height_elem.value && weight_elem.value) {
    $("[name='annual_evaluation[bmi]'")[0].value = Math.round((weight_lbs * 703 / (height_inches * height_inches)) * 100)/100
  }
}

$(document).ready(function() {
  showWhenValueEquals("[name='annual_evaluation[ae_received]']", "true", "#ae_evaluation_info");

  toggleLabel("#ae_isncsci_left_motor_lbl", "Left Motor", "Motor", 
    "#ae_isncsci [name='annual_evaluation[asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#ae_isncsci_left_sensory_lbl", "Left Sensory", "Sensory", 
    "#ae_isncsci [name='annual_evaluation[asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#ae_isncsci_zpp_left_motor_lbl", "Left Motor", "Motor", 
     "#ae_isncsci [name='annual_evaluation[asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#ae_isncsci_zpp_left_sensory_lbl", "Left Sensory", "Sensory", 
    "#ae_isncsci [name='annual_evaluation[asia_attributes][has_motor_or_sensory_asymmetry]']");  

  showWhenValueEquals("[name='annual_evaluation[change_in_asia]']", "true", "#ae_isncsci_info");
  showWhenValueEquals("[name='annual_evaluation[asia_attributes][has_motor_or_sensory_asymmetry]']", "true", "#ae_isncsci_asymmetrical");
  showWhenValueEquals("[name='annual_evaluation[asia_attributes][is_complete]']", "true", "#ae_isncsci_zone_of_partial_preservation");
  showWhenValueEquals("[name='annual_evaluation[asia_attributes][has_motor_or_sensory_asymmetry]']", "true", "#ae_isncsci_zpp_asymmetrical");

  // Set up BMI auto-calculation.
  $("[name='annual_evaluation[height_inches]'").on('change', recalculateBmi);
  $("[name='annual_evaluation[weight_lbs]'").on('change', recalculateBmi);
  recalculateBmi();  // Trigger initial calcluation.
});

