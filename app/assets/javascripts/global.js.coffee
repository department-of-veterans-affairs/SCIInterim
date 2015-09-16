# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", -> 
	$('#all-link').click -> 
		$('#patients-section').fadeToggle()

root = exports ? this
root.showWhenValueEquals = (selector, toggleValue, toggleSelector, action = 'change') ->
  $(selector).on action, ->
    selected = this
    exemptionField = $(toggleSelector)
    if selected.value is toggleValue.toString()
      exemptionField.show()
    else
      exemptionField.hide()
    return
  return