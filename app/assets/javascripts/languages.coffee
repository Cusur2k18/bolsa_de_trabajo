$ ->
	console.log('pito')
	hiddenField = $('#has-certificate')
	hiddenField.hide()
	$('#language_has_certificate_si').change( -> hiddenField.show())
	$('#language_has_certificate_no').change( -> hiddenField.hide())

