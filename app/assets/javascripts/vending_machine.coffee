# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  console.log('asdf')
  $("#asdf").on("ajax:success", (event) ->
    [_data, _status, xhr] = event.detail
    console.log(_data)
    $("#ans").replaceWith "<pre id=\"ans\">#{JSON.stringify(_data,null,2)}</pre>"

  ).on "ajax:error", (event) ->
    console.log('fuck')