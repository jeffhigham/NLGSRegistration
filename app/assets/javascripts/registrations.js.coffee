String.prototype.capitalize = ->
  @charAt(0).toUpperCase() + @slice(1);

calculate = ->
  debug = true
  price = 3795
  console.log "Starting price: $#{price}.00" if debug
  primary_pop_type = "- #{$('#registration_primary_pop_display_type').val().capitalize()}"
  $('.senior-pop-space').html("$0 (1 #{primary_pop_type})")
  
  additional_attendees = parseInt( $('.secondary-contacts').length ) || 0
  attendee_price = parseInt(additional_attendees*500)
  price += attendee_price
  $('.attendees-price').html("$#{attendee_price} (#{additional_attendees})")
  console.log "With #{additional_attendees} attendees add $#{attendee_price} price: $#{price}.00" if debug

  pop_spaces = parseInt( $(".pop-spaces select").first().val() ) || 0
  pop_price = parseInt(pop_spaces*100)
  price += pop_price
  pop_type = "- #{$(".pop-spaces select").last().val().capitalize()}"
  $('.pop-price').html("$#{pop_price} (#{pop_spaces} #{pop_type})")
  console.log "With #{pop_spaces} POP spaces add $#{pop_price} price: $#{price}.00" if debug

  proto_spaces = parseInt($(".proto-spaces select").first().val()) || 0
  proto_price = 0
  if proto_spaces == 1
    proto_price = 250
  else if proto_spaces == 2
    proto_price = 350
  else if proto_spaces == 3
    proto_price = 450
  price += proto_price
  $('.proto-price').html("$#{proto_price} (#{proto_spaces})")
  console.log "With #{proto_spaces} Proto spaces add $#{proto_price} price: $#{price}.00" if debug

  via_sponsorship = $(".via-sponsorship select").first().val() == "true"
  via_price = 0
  if via_sponsorship
    via_price = 750
    price += via_price
    console.log "With VIA sponsorship add $#{via_price} price: $#{price}.00" if debug
  $('.via-price').html("$#{via_price}")

  $('.price').html("$#{price}.00")
  console.log "Price: $#{price}.00"

jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    $(this).closest('fieldset').removeClass("secondary-contacts")
    calculate()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    calculate()
    event.preventDefault()

  # Industry Selections
  $('#company_industries').on 'click', (event) ->
    industry_selections = $(@).val()
    if parseInt(industry_selections.length) == 2
      console.log "Showing LG / Pet"
      $('#lg-priority-selections').show()
      $('#pet-priority-selections').show()
    else if parseInt(industry_selections[0]) == 1
      $('#lg-priority-selections').show()
      $('#pet-priority-selections').hide()
    else if parseInt(industry_selections[0]) == 2
      $('#lg-priority-selections').hide()
      $('#pet-priority-selections').show()
    else
      $('#lg-priority-selections').hide()
      $('#pet-priority-selections').hide()

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

  $('.pop-spaces select, .proto-spaces select, .primary-pop-space select, .proto-spaces select, .via-sponsorship select').on 'change', (event) ->
    calculate()


$(document).ready ->
  calculate()
  #
  # populate priority lists on vendor edit
  #
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

  if $('#registration_lg_categories').length
    registration_lg_categories = $('#registration_lg_categories').val()
    if registration_lg_categories.length > 0
      lg_categories = registration_lg_categories.split ","
      for category in lg_categories
        console.log "Setting - #lg_category_selection_#{category}"
        $("#lg_category_selection_#{category}").prop('checked', true)
        $("#lg_category_selection_#{category}").next(".custom .checkbox").addClass("checked")

  if $('#registration_pet_categories').length
    registration_pet_categories = $('#registration_pet_categories').val()
    if registration_pet_categories.length > 0
      pet_categories = registration_pet_categories.split ","
      for category in pet_categories
        console.log "Setting - #pet_category_selection_#{category}"
        $("#pet_category_selection_#{category}").prop('checked', true)
        $("#pet_category_selection_#{category}").next(".custom .checkbox").addClass("checked")