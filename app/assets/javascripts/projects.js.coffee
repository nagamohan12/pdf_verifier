# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $(".bs-example-modal-lg").on "show.bs.modal", ->
    $(".modal .modal-content").css "overflow-y", "auto"
    $(".modal .modal-content").css "height", screen.height * 0.77
    return
  $(".bs-example-modal-lg").on "hidden.bs.modal", (e) ->
    $(this).removeData('bs.modal');
  $(".panel").on "show.bs.collapse", (e) ->
    console.log('Event fired on #' + e.currentTarget.id);