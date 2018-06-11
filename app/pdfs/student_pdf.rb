class StudentPdf < Prawn::Document
	def initialize(student)
		super()
		@student = student
		text "#{@student.first_name} #{@student.last_name} #{@student.last_m_name}", size: 20, style: :bold
		stroke_horizontal_rule
		personal_data
		school
		previous_jobs
		awards_courses
	end

	def personal_data
		move_down 20
		text "Datos personales", size: 15, style: :bold
		stroke_horizontal_rule
		move_down 10
		text "Correo electronico: #{@student.user.email}"
		address
		phone_numbers
	end

	def school
		move_down 20
		text "Formación Académica", size: 15, style: :bold
		stroke_horizontal_rule
		move_down 10
		@student.educations.each do |ed|
			text "#{ed.education_level}", style: :bold
			text "#{ed.university}"
			text "#{ed.admission_date} - #{ed.graduation_date}  #{ed.major}"
		end

	end

	def previous_jobs
		move_down 20
		text "Experiencia Laboral", size: 15, style: :bold
		stroke_horizontal_rule
		move_down 10
		@student.former_jobs.each do |fj|
			text "Empresa: #{fj.enterprise_name}"
			text "Puesto: #{fj.job_title}"
			text "¿Trabajo actual? #{fj.is_current_job}"
		end
	end

	def awards_courses
		move_down 20
		text "Premios, cursos, idiomas ", size: 15, style: :bold
		stroke_horizontal_rule
		awards
		courses
		languages
	end


	def awards
		move_down 10
		@student.academic_awards.each do |aw|
			text "Nombre: #{aw.name}"
			text "Organización que lo expide: #{aw.issuing_organism}"
			text "Fecha: #{aw.award_date}"
		end
	end

	def courses
		move_down 10
		@student.courses.each do |cr|
			text "Nombre: #{cr.name}"
			text "Organización que lo expide: #{cr.issuing_organism}"
			text "Fecha: #{cr.start_date} a #{cr.end_date}"
		end
	end

	def languages
		move_down 10
		@student.languages.each do |ln|
			text "Idioma: #{ln.name}"
			text "Nivel: #{ln.language_level}"
		end
	end

	def address
		move_down 10
		text "#{@student.user.address.city}, #{@student.user.address.state}"
		text "#{@student.user.address.street}, Num Ext. \##{@student.user.address.street_address}, Num Int. \##{@student.user.address.apartment_number}, C.P. #{@student.user.address.zip_code}"
	end

	def phone_numbers
		move_down 10
		@student.user.phone_numbers.each do |nb|
			text "Numero de celular: #{nb.cell_phone_number}, Numero de casa: #{nb.home_phone_number}"
		end
	end

end
