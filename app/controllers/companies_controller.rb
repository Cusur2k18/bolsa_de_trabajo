class CompaniesController < ApplicationController
	
	def edit
		if current_user.roleable.id == Company.find(params[:id]).id
			@company = Company.find(params[:id])
		else
			redirect_to root_path
		end
	end

	def update
		@company = Company.find(params[:id])
		@company.update_attributes(companies_params)
		redirect_to companies_dashboard_path
	end


	private

	def companies_params
		params.require(:company).permit(:company_name, :contact_first_name, :contact_last_name, :contact_last_m_name, :contact_employement )
	end
end
