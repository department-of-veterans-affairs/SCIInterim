# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", -> 
	$('#all-link').click -> 
		$('#patients-section').fadeToggle()

$(document).ready ->
  showWhenValueEquals "[name='patient[travel_status_id]']", 4, "#benefitsOther"
  showWhenValueEquals "[name='patient[scid_eligibility_id]']", 1, "#sciDetails"
  showWhenValueEquals "[name='patient[scid_eligibility_id]']", 4, "#sciOther"
  showWhenValueEquals "[name='patient[is_receiving_non_va_care]']", "true", "#bowelBladderDetails"