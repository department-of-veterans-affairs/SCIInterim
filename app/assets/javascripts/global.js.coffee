# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", -> 
	$('#all-link').click -> 
		$('#patients-section').fadeToggle()

root = exports ? this

root.showWhenValueEquals = (selector, toggleValue, toggleSelector, action = 'change') ->
  if $(selector).prop('tagName') is 'SELECT'
    showWhenValueEqualsOptions selector, toggleValue, toggleSelector, action
  else
    showWhenValueEqualsChecked selector, toggleValue, toggleSelector, action

showWhenValueEqualsChecked = (selector, toggleValue, toggleSelector, action = 'change') ->
  $(selector).on action, ->
    selected = this
    exemptionField = $(toggleSelector)
    if $(selected).is(':checked')
      if selected.value is toggleValue.toString()
          exemptionField.slideDown()
      else
          exemptionField.slideUp()
      return
    return
  $(selector).trigger action
  return

showWhenValueEqualsOptions = (selector, toggleValue, toggleSelector, action = 'change') ->
  $(selector).on action, ->
    changed = this
    selected = $(selector).find("option:selected")
    exemptionField = $(toggleSelector)
    if selected.val() is toggleValue.toString()
        exemptionField.slideDown()
    else
        exemptionField.slideUp()
    return
  $(selector).trigger action
  return