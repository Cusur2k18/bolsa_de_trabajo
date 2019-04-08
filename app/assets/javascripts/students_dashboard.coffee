# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
	$('.toggleable').hide()
	$('div.trigger').click( ->
		$('.toggleable').toggle('slow')
	)
$(document).on('turbolinks:load', ready)
