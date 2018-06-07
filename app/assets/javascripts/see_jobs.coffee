# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	selectedFilter = $('#filter')
	selectedFilter.change( ->
		classToShow = ""
		trClass = "myTr"
		$( "#filter option:selected").each( ->
			classToShow += $(this).val()

			if classToShow is "cualquiera"
				$(trClass).change(-> classToShow.hide())
				$(trClass).change(-> trClass.show())
				console.log(trClass)
			else
				$(trClass).change(-> trClass.hide())
				$(trClass).change(-> classToShow.show())
				console.log(classToShow)
		)
	).change
	
