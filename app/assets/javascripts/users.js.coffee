# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  
  $('#resend_link').on 'click', (e)->
    e.preventDefault()
    if $('#new_user #user_email').val() != ""
      $('#resend_confirmation #resend_email').val($('#new_user #user_email').val())
      $('#resend_confirmation').submit()