# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $('a').addClass("tiny radius button")

  $('.lg-priority').on 'blur', (event) ->
    event.preventDefault()
    priorities = "#{$($('.lg-priority')[0]).val()},#{$($('.lg-priority')[1]).val()},#{$($('.lg-priority')[2]).val()},#{$($('.lg-priority')[3]).val()},#{$($('.lg-priority')[4]).val()}"
    $('#registration_lg_priorities').val(priorities)
    console.log "Adding LG Priorities: #{priorities}"
    console.log "LG Registration Priorities: #{$('#registration_lg_priorities').val()}"
  
  $('.pet-priority').on 'blur', (event) ->
    event.preventDefault()
    priorities = "#{$($('.pet-priority')[0]).val()},#{$($('.pet-priority')[1]).val()},#{$($('.pet-priority')[2]).val()},#{$($('.pet-priority')[3]).val()},#{$($('.pet-priority')[4]).val()}"
    $('#registration_pet_priorities').val(priorities)
    console.log "Adding Pet Priorities: #{priorities}"
    console.log "Pet Registration Priorities: #{$('#registration_pet_priorities').val()}"
