class StudentRegistrationsController < Devise::RegistrationsController

	prepend_before_filter :require_no_authentication, [:new]
	def new
		@student = Student.new
		super
	end

	def create
		build_resource(sign_up_params)

		@student = Student.new
		# students params
		@student.first_name = params[:first_name]
		@student.last_name = params[:last_name]
		@student.last_m_name = params[:last_m_name]
		@student.udg_code = params[:udg_code]
		@student.born_date = params[:born_date]
		@student.academic_level = params[:academic_level]
		@student.terms_of_service = params[:terms_of_service]

		#assigning the enum data
		if params[:genre] == "masculino"
			@student.genre = 0
		else
			@student.genre = 1
		end

		if params[:civil_status] == "soltero"
			@student.civil_status = 0
		elsif params[:civil_status] == "casado"
			@student.civil_status = 1
		elsif params[:civil_status ] == "viudo"
			@student.civil_status = 2
		else 
			@student.civil_status =3
		end



		if @student.save
			resource.roleable = @student
			resource.save

			yield resource if block_given?
			if resource.persisted?
				if resource.active_for_authentication?
					set_flash_message! :notice, :signed_up
					sign_up(resource_name, resource)
					respond_with resource, location: after_sign_up_path_for(resource)
				else
					set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
					expire_data_after_sign_in!
					respond_with resource, location: after_inactive_sign_up_path_for(resource)
				end
			else
				clean_up_passwords resource
				set_minimum_password_length
				respond_with resource
			end
		else
			render :new
		end
	end

	def after_sign_up_path_for(resource)
		student_dashboard_path || super
	end
end
