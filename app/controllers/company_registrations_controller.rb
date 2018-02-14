class CompanyRegistrationsController < Devise::RegistrationsController
	def new
		@company = Company.new
		@user = User.new
	end

	def create
		build_resource(sign_up_params)
		@company = Company.new
		# companies params

		@company.company_name = params[ :company_name ]
		@company.contact_first_name = params[ :contact_first_name ]
		@company.contact_last_name = params[ :contact_last_name ]
		@company.contact_last_m_name = params[ :contact_last_m_name ]
		@company.contact_employement = params[ :contact_employement ]	
		@company.is_validated = params[ :is_validated ]

		if @company .save
			resource.roleable = @company
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
		companies_dashboard_path || super
	end

end