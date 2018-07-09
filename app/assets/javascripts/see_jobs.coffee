ready = ->
	selectedFilter = $('#filter')
	selectedFilter.change(->
		classToShow = ''
		trClass = '.myTr'
		defaultClass = '.cualquiera'
		# we get the value of the combobox, split it to a string and then join it in case it is more than 1 word separated by spaces
		selectedValue = '.' + $('#filter option:selected').val()
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

$(document).ready(ready)
$(document).on('turbolinks:load', ready)

