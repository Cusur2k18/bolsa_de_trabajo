class RegistrationsController < Devise::RegistrationsController

	def new_student
		@student = Student.new
	end

	def new_company
	end

	def new_admin
	end
	def create_student

		@student = Student.new(student_params)
		@student.build_user

		if @student.save
			redirect_to student_dashboard_path
		end

	end

	def create_company

	#	@company = User.new(company_params)
	#	if @company.save
	#		redirect_to companies_dashboard_path
	#	end

	end

	def create_admin

	#	@admin = User.new(admin_params)
	#	if @admin.save
	#		redirect_to root_path
	#	else
	#		redirect_to root_path
	#	end

	end

	private

	def student_params
		params.permit(:first_name, :last_name, :last_m_name, :udg_code, :state, :user_attributes => [:email, :password, :password_confirmation])
	end

	def company_params
		params.require(:company).permit(:company_name, :contact_first_name, :contact_last_name, :contact_last_m_name, :contact_employement, :is_validated, :user_attributes => [:email, :password, :password_confirmation])
	end

	def admin_params
		params.require(:admin).permit(:name, :last_name, :last_m_name, :user_attributes => [:email, :password, :password_confirmation])
	end
end
