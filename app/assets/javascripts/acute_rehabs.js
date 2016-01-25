// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  showWhenValueEquals("[name='acute_rehab[reason_for_admission_id]']", 4, "#acuteRehabAdmissionOther");

  showWhenValueEquals("[name='acute_rehab[start_asia_attributes][has_motor_or_sensory_asymmetry]']", "true", "#form_start_asymmetrical");
  showWhenValueEquals("[name='acute_rehab[start_asia_attributes][has_motor_or_sensory_asymmetry]']", "true", "#form_start_zpp_asymmetrical");
  showWhenValueEquals("[name='acute_rehab[start_asia_attributes][is_complete]']", "true", "#form_start_zone_of_partial_preservation");

  toggleLabel("#form_start_left_motor_lbl", "Left Motor", "Motor", 
    "#form_start [name='acute_rehab[start_asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#form_start_left_sensory_lbl", "Left Sensory", "Sensory", 
    "#form_start [name='acute_rehab[start_asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#form_start_zpp_left_motor_lbl", "Left Motor", "Motor", 
    "#form_start [name='acute_rehab[start_asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#form_start_zpp_left_sensory_lbl", "Left Sensory", "Sensory", 
    "#form_start [name='acute_rehab[start_asia_attributes][has_motor_or_sensory_asymmetry]']");  

  showWhenValueEquals("[name='acute_rehab[finish_asia_attributes][has_motor_or_sensory_asymmetry]']", "true", "#form_finish_asymmetrical");
  showWhenValueEquals("[name='acute_rehab[finish_asia_attributes][has_motor_or_sensory_asymmetry]']", "true", "#form_finish_zpp_asymmetrical");
  showWhenValueEquals("[name='acute_rehab[finish_asia_attributes][is_complete]']", "true", "#form_finish_zone_of_partial_preservation");

  toggleLabel("#form_finish_left_motor_lbl", "Left Motor", "Motor", 
    "#form_finish [name='acute_rehab[finish_asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#form_finish_left_sensory_lbl", "Left Sensory", "Sensory", 
    "#form_finish [name='acute_rehab[finish_asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#form_finish_zpp_left_motor_lbl", "Left Motor", "Motor", 
    "#form_finish [name='acute_rehab[finish_asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#form_finish_zpp_left_sensory_lbl", "Left Sensory", "Sensory", 
    "#form_finish [name='acute_rehab[finish_asia_attributes][has_motor_or_sensory_asymmetry]']");  
});
