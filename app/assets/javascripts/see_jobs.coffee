$ ->
	selectedFilter = $('#filter')
	selectedFilter.change(->
		classToShow = ''
		trClass = '.myTr'
		defaultClass = '.cualquiera'
		selectedValue = '.' + $('#filter option:selected').val()
		if selectedValue is defaultClass
			$(trClass).show()
			console.log(trClass)
		else
			$(trClass).hide()
			$(selectedValue).show()
			console.log(selectedValue)
	)

