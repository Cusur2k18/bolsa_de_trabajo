class CompanyPdf < Prawn::Document
	def initialize(company)
		super()
		@company = company
		text "#{@company.company_name}", style: :bold, size: 20
		stroke_horizontal_rule
		move_down 20
		company_data
	end

	def company_data 
		text "Datos de la empresa", style: :bold, size: 15
		stroke_horizontal_rule
		move_down 20
		text "Correo electrónico #{@company.user.email}"
		text "Sitio web: #{@company.website}"
		text "RFC: #{@company.rfc}"
		text "Fecha de apertura: #{@company.foundation_date}"
		text "Tipo: #{@company.category}"
		if !@company.user.address.nil?
			address_data
		end
		if !@company.user.phone_numbers.nil?
			phone_number_data
		end
		attendant_data
		if !@company.jobs.nil?
			vacancies_list
		end
	end

	def vacancies_list
		move_down 20
		text "Vacantes registradas", style: :bold, size: 15
		stroke_horizontal_rule
		move_down 10
		@company.jobs.each do |jb|
			text "Nombre: #{jb.name}", style: :bold
			text "Salario: $#{jb.salary}"
			text "Categorias: "
			jb.job_types.each do |jt|
				text "•#{jt.area}"
			end
			move_down 10
		end
	end

	def attendant_data
		move_down 10
		text "Datos de la persona que registro la empresa", style: :bold
		stroke_horizontal_rule
		move_down 10
		text "Nombre: #{@company.contact_first_name} #{@company.contact_last_name} #{@company.contact_last_m_name}"
		text "Puesto: #{@company.contact_employement}"
	end

	def address_data
		move_down 10
		text "#{@company.user.address.city} #{@company.user.address.state}"
		text "Domicilio: #{@company.user.address.street}, Num exterior: #{@company.user.address.street_address}, Num interior: #{@company.user.address.apartment_number} C.P. #{@company.user.address.zip_code}"
	end

	def phone_number_data
		move_down 10
		@company.user.phone_numbers.each do |pn|
			text "Numero de celular:  #{pn.cell_phone_number}, \nNumero de celular:  #{pn.home_phone_number}"
		end
	end
end
