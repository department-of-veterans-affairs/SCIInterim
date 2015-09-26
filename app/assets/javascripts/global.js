// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function showWhenValueEquals(selector, toggleValue, toggleSelector, action) {
  action = typeof action !== 'undefined' ? action : 'change';
  if ($(selector).prop('tagName') == 'SELECT') {
    showWhenValueEqualsOptions(selector, toggleValue, toggleSelector, action);
  } else {
    showWhenValueEqualsChecked(selector, toggleValue, toggleSelector, action);
  }
}

function showWhenValueEqualsChecked(selector, toggleValue, toggleSelector, action) {
  $(selector).on(action, function() {
    selected = this;
    exemptionField = $(toggleSelector);
    if ($(selected).is(':checked')) {
      if (selected.value == toggleValue.toString()) {
          exemptionField.slideDown();
      } else {
        exemptionField.slideUp();
      }
    }
  });
  $(selector).trigger(action)
}

function showWhenValueEqualsOptions(selector, toggleValue, toggleSelector, action) {
  $(selector).on(action, function() {
    selected = this;
    selected = $(selector).find("option:selected");
    exemptionField = $(toggleSelector);
    if (selected.val() == toggleValue.toString()) {
      exemptionField.slideDown();
    } else {
      exemptionField.slideUp();
    }
  });
  $(selector).trigger(action);
}

$(document).ready(function() {
  // ASIA Conditional things
  showWhenValueEquals("[name='patient[asia_assessment][has_motor_or_sensory_asymmetry]']", "true", "#asymmetry");
  showWhenValueEquals("[name='patient[asia_assessment][is_complete]']", "true", "#complete");
});
