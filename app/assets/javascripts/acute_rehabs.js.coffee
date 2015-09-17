# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  showWhenValueEquals "[name='acute_rehab[reason_for_admission_id]']", 4, "#acuteRehabAdmissionOther"

