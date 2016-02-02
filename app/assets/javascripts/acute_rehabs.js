// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  showWhenValueEquals("[name='acute_rehab[goals_met]']", false, "#goals_missed");

  showWhenValueEquals("[name='acute_rehab[reason_for_admission_id]']", 4, "#acuteRehabAdmissionOther");

  showWhenValueEquals("[name='acute_rehab[start_asia_attributes][has_motor_or_sensory_asymmetry]']", "true", "#form_start_asymmetrical");
  showWhenValueEquals("[name='acute_rehab[start_asia_attributes][has_motor_or_sensory_asymmetry]']", "true", "#form_start_zpp_asymmetrical");
  showWhenValueEquals("[name='acute_rehab[start_asia_attributes][impairment_scale_id]']", 1, "#form_start_zone_of_partial_preservation");

  toggleLabel("#form_start_left_motor_lbl", "Left Motor", "Motor", 
    "#form_start [name='acute_rehab[start_asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#form_start_left_sensory_lbl", "Left Sensory", "Sensory", 
    "#form_start [name='acute_rehab[start_asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#form_start_zpp_left_motor_lbl", "Left Motor", "Motor", 
    "#form_start [name='acute_rehab[start_asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#form_start_zpp_left_sensory_lbl", "Left Sensory", "Sensory", 
    "#form_start [name='acute_rehab[start_asia_attributes][has_motor_or_sensory_asymmetry]']");  

  changeOptionWhenValueEquals("[name='acute_rehab[start_asia_attributes][neurological_motor_level_left_id]']", 
    "[name='acute_rehab[start_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='acute_rehab[start_asia_attributes][neurological_sensory_level_left_id]']", 
    "[name='acute_rehab[start_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='acute_rehab[start_asia_attributes][neurological_motor_level_right_id]']", 
    "[name='acute_rehab[start_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='acute_rehab[start_asia_attributes][neurological_sensory_level_right_id]']", 
    "[name='acute_rehab[start_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='acute_rehab[start_asia_attributes][preservation_motor_level_left_id]']", 
    "[name='acute_rehab[start_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='acute_rehab[start_asia_attributes][preservation_sensory_level_left_id]']", 
    "[name='acute_rehab[start_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='acute_rehab[start_asia_attributes][preservation_motor_level_right_id]']", 
    "[name='acute_rehab[start_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='acute_rehab[start_asia_attributes][preservation_sensory_level_right_id]']", 
    "[name='acute_rehab[start_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='acute_rehab[start_asia_attributes][has_motor_or_sensory_asymmetry]']", 
    "[name='acute_rehab[start_asia_attributes][impairment_scale_id]']", 5, false);

  showWhenValueEquals("[name='acute_rehab[finish_asia_attributes][has_motor_or_sensory_asymmetry]']", "true", "#form_finish_asymmetrical");
  showWhenValueEquals("[name='acute_rehab[finish_asia_attributes][has_motor_or_sensory_asymmetry]']", "true", "#form_finish_zpp_asymmetrical");
  showWhenValueEquals("[name='acute_rehab[finish_asia_attributes][impairment_scale_id]']", 1, "#form_finish_zone_of_partial_preservation");

  toggleLabel("#form_finish_left_motor_lbl", "Left Motor", "Motor", 
    "#form_finish [name='acute_rehab[finish_asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#form_finish_left_sensory_lbl", "Left Sensory", "Sensory", 
    "#form_finish [name='acute_rehab[finish_asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#form_finish_zpp_left_motor_lbl", "Left Motor", "Motor", 
    "#form_finish [name='acute_rehab[finish_asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#form_finish_zpp_left_sensory_lbl", "Left Sensory", "Sensory", 
    "#form_finish [name='acute_rehab[finish_asia_attributes][has_motor_or_sensory_asymmetry]']");  

  changeOptionWhenValueEquals("[name='acute_rehab[finish_asia_attributes][neurological_motor_level_left_id]']", 
    "[name='acute_rehab[finish_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='acute_rehab[finish_asia_attributes][neurological_sensory_level_left_id]']", 
    "[name='acute_rehab[finish_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='acute_rehab[finish_asia_attributes][neurological_motor_level_right_id]']", 
    "[name='acute_rehab[finish_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='acute_rehab[finish_asia_attributes][neurological_sensory_level_right_id]']", 
    "[name='acute_rehab[finish_asia_attributes][impairment_scale_id]']", 5, 1);
  
  changeOptionWhenValueEquals("[name='acute_rehab[finish_asia_attributes][preservation_motor_level_left_id]']", 
    "[name='acute_rehab[finish_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='acute_rehab[finish_asia_attributes][preservation_sensory_level_left_id]']", 
    "[name='acute_rehab[finish_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='acute_rehab[finish_asia_attributes][preservation_motor_level_right_id]']", 
    "[name='acute_rehab[finish_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='acute_rehab[finish_asia_attributes][preservation_sensory_level_right_id]']", 
    "[name='acute_rehab[finish_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='acute_rehab[finish_asia_attributes][has_motor_or_sensory_asymmetry]']", 
    "[name='acute_rehab[finish_asia_attributes][impairment_scale_id]']", 5, false);
});
