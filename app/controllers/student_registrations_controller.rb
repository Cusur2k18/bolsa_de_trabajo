class StudentRegistrationsController < Devise::RegistrationsController

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
		@student.state = params[:state]

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
