# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).foundation()
(($) ->
  allSections = $('.expander-container > .new-section').hide()
  $('.expander-container > .row > .add-new-section').click ->
    $(this).parent().prev().slideDown()
    false
  return
) jQuery