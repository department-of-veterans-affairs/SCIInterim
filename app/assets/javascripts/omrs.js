// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  showWhenValueEquals("[name='omr[goals_met]']", false, "#goals_missed");

  showWhenValueEquals("[name='omr[start_asia_attributes][has_motor_or_sensory_asymmetry]']", "true", "#asia_form_start_asymmetrical");
  showWhenValueEquals("[name='omr[start_asia_attributes][has_motor_or_sensory_asymmetry]']", "true", "#asia_form_start_zpp_asymmetrical");
  showWhenValueEquals("[name='omr[start_asia_attributes][impairment_scale_id]']", 1, "#asia_form_start_zone_of_partial_preservation");

  toggleLabel("#asia_form_start_left_motor_lbl", "Left Motor", "Motor", 
    "#asia_form_start [name='omr[start_asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#asia_form_start_left_sensory_lbl", "Left Sensory", "Sensory", 
    "#asia_form_start [name='omr[start_asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#asia_form_start_zpp_left_motor_lbl", "Left Motor", "Motor", 
    "#asia_form_start [name='omr[start_asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#asia_form_start_zpp_left_sensory_lbl", "Left Sensory", "Sensory", 
    "#asia_form_start [name='omr[start_asia_attributes][has_motor_or_sensory_asymmetry]']");  

  changeOptionWhenValueEquals("[name='omr[start_asia_attributes][neurological_motor_level_left_id]']", 
    "[name='omr[start_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='omr[start_asia_attributes][neurological_sensory_level_left_id]']", 
    "[name='omr[start_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='omr[start_asia_attributes][neurological_motor_level_right_id]']", 
    "[name='omr[start_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='omr[start_asia_attributes][neurological_sensory_level_right_id]']", 
    "[name='omr[start_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='omr[start_asia_attributes][preservation_motor_level_left_id]']", 
    "[name='omr[start_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='omr[start_asia_attributes][preservation_sensory_level_left_id]']", 
    "[name='omr[start_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='omr[start_asia_attributes][preservation_motor_level_right_id]']", 
    "[name='omr[start_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='omr[start_asia_attributes][preservation_sensory_level_right_id]']", 
    "[name='omr[start_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='omr[start_asia_attributes][has_motor_or_sensory_asymmetry]']", 
    "[name='omr[start_asia_attributes][impairment_scale_id]']", 5, false);

  showWhenValueEquals("[name='omr[finish_asia_attributes][has_motor_or_sensory_asymmetry]']", "true", "#asia_form_finish_asymmetrical");
  showWhenValueEquals("[name='omr[finish_asia_attributes][has_motor_or_sensory_asymmetry]']", "true", "#asia_form_finish_zpp_asymmetrical");
  showWhenValueEquals("[name='omr[finish_asia_attributes][impairment_scale_id]']", 1, "#asia_form_finish_zone_of_partial_preservation");

  toggleLabel("#asia_form_finish_left_motor_lbl", "Left Motor", "Motor", 
    "#asia_form_finish [name='omr[finish_asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#asia_form_finish_left_sensory_lbl", "Left Sensory", "Sensory", 
    "#asia_form_finish [name='omr[finish_asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#asia_form_finish_zpp_left_motor_lbl", "Left Motor", "Motor", 
    "#asia_form_finish [name='omr[finish_asia_attributes][has_motor_or_sensory_asymmetry]']");  

  toggleLabel("#asia_form_finish_zpp_left_sensory_lbl", "Left Sensory", "Sensory", 
    "#asia_form_finish [name='omr[finish_asia_attributes][has_motor_or_sensory_asymmetry]']");  

  changeOptionWhenValueEquals("[name='omr[finish_asia_attributes][neurological_motor_level_left_id]']", 
    "[name='omr[finish_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='omr[finish_asia_attributes][neurological_sensory_level_left_id]']", 
    "[name='omr[finish_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='omr[finish_asia_attributes][neurological_motor_level_right_id]']", 
    "[name='omr[finish_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='omr[finish_asia_attributes][neurological_sensory_level_right_id]']", 
    "[name='omr[finish_asia_attributes][impairment_scale_id]']", 5, 1);


  changeOptionWhenValueEquals("[name='omr[finish_asia_attributes][preservation_motor_level_left_id]']", 
    "[name='omr[finish_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='omr[finish_asia_attributes][preservation_sensory_level_left_id]']", 
    "[name='omr[finish_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='omr[finish_asia_attributes][preservation_motor_level_right_id]']", 
    "[name='omr[finish_asia_attributes][impairment_scale_id]']", 5, 1);

  changeOptionWhenValueEquals("[name='omr[finish_asia_attributes][preservation_sensory_level_right_id]']", 
    "[name='omr[finish_asia_attributes][impairment_scale_id]']", 5, 1);
  
  changeOptionWhenValueEquals("[name='omr[finish_asia_attributes][has_motor_or_sensory_asymmetry]']", 
    "[name='omr[finish_asia_attributes][impairment_scale_id]']", 5, false);
});