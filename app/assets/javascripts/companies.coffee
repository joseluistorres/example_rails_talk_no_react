# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $(document).on 'change', '#companies', (e) ->
    # load users
    $.ajax
      url: "/companies/#{$(this).val()}/users"
      success: (data) ->
        html = '<option value=0></option>'
        for key of data
          html += '<option value=' + data[key].id + '>' + data[key].username + '</option>'

        $('#users')
         .html(html)
         .removeClass('hidden')
      dataType: 'json'

  $(document).on 'change', '#users', (e) ->
    # load users
    $.ajax
      url: "/users/#{$(this).val()}/machine_data"
      success: (data) ->
        html = '<option value=0></option>'
        for key of data
          html += '<option data-preread=' + JSON.stringify(data[key].preread_json) + ' value=' + data[key].id + '>' + data[key].name + '</option>'

        $('#machine_data')
         .html(html)
         .removeClass('hidden')
      dataType: 'json'

  $(document).on 'change', '#machine_data', (e) ->
    # load users
    ingredients = $(this).find(':selected').data('preread').ingredients
    debugger
    $('#ingredients').val(JSON.stringify(ingredients)).removeClass('hidden')