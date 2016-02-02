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

///////////////////////////////////////////////////////////////////////////////
// changeTFWhenOtherEquals
// Changes a TF radio value based on another controls value
///////////////////////////////////////////////////////////////////////////////
function changeTFWhenOtherEquals(radio_selector, source_selector, value) {
  var value = ""
  $(source_selector).change(function() {
    if ($(this).prop('tagName') == 'SELECT') {
      value = $(this).find("option:selected").text();
    }
    else {
      value = $(this).is(':checked')
    }
  });

  alert(value);
}

///////////////////////////////////////////////////////////////////////////////
// toggleCongrolLabel
// Toggles a label's text based on the truthiness of the a radio control.
///////////////////////////////////////////////////////////////////////////////
function toggleLabel(labelSel, trueText, falseText, controlSel) {
  var truthy = ["yes", "true", "t", "1"];

  $(controlSel).change(function() {
    var controlValue = $(controlSel + ":checked").val();

    if (controlValue) {
      var inArray = jQuery.inArray(controlValue.toLowerCase(), truthy);
      $(labelSel).text(inArray == 1 ? trueText : falseText);
    }
  });

  $(controlSel).change();
}

$(document).ready(function() {
  // ASIA Conditional things
});
