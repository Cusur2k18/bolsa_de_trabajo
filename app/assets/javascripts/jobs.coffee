# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
	selectedFilter = $('#c-filter')
	selectedFilter.change(->
		classToShow = ''
		trClass = '.myTr'
		defaultClass = '.cualquiera'
		# we get the value of the combobox, split it to a string and then join it in case it is more than 1 word separated by spaces
		selectedValue = '.' + $('#c-filter option:selected').val()
		selectedValue = selectedValue.split ' '
		selectedValue = selectedValue.join('')
		if selectedValue is defaultClass
			$(trClass).show()
			console.log(trClass)
		else
			$(trClass).hide()
			$(selectedValue).show()
			console.log(selectedValue)
	)

$(document).on('turbolinks:load', ready)

