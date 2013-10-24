# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
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

  # Vendor Selections
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

  # Buyer Selections
  $('.lg_category_selection').on 'change', (event) ->
    selected = []
    for lg_category in $('.lg_category_selection')
      if lg_category.checked
        category = lg_category.id.split('_').pop()
        selected.push(category)
    # console.log selected.toString()
    $('#registration_lg_categories').val(selected.toString())
    console.log $('#registration_lg_categories').val()
  
  $('.pet_category_selection').on 'change', (event) ->
    selected = []
    for pet_category in $('.pet_category_selection')
      if pet_category.checked
        category = pet_category.id.split('_').pop()
        selected.push(category)
    # console.log selected.toString()
    $('#registration_pet_categories').val(selected.toString())
    console.log $('#registration_pet_categories').val()


$(document).ready ->

  if $('#registration_lg_priorities').length
    registration_lg_priorities = $('#registration_lg_priorities').val()
    if registration_lg_priorities.length > 0
      lg_priorities = registration_lg_priorities.split ","
      for priority,index in lg_priorities
        $("#lg_priority_#{index+1}").val(lg_priorities[index])
        # console.log("Populating #lg_priority_#{index+1} with %s", lg_priorities[index])

  if $('#registration_pet_priorities').length
    registration_pet_priorities = $('#registration_pet_priorities').val()
    if registration_pet_priorities.length > 0
      pet_priorities = registration_pet_priorities.split ","
      for priority,index in pet_priorities
        $("#pet_priority_#{index+1}").val(pet_priorities[index])
        # console.log("Populating #pet_priority_#{index+1} with %s", pet_priorities[index])
















