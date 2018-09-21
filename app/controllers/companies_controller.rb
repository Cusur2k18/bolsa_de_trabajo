class CompaniesController < ApplicationController
	def index
		if is_admin
			@companies = Company.all
		else
			flash[:notice] = "No puedes acceder a esta pagina"
			redirect_to root_path
		end
	end

	def edit
		if current_user.roleable.id == Company.find(params[:id]).id
			@company = Company.find(params[:id])
		else
			redirect_to root_path
		end
	end

	def validate
		@company = Company.find(params[:id])
		@company.is_validated = true
		@company.save
		redirect_to companies_path
	end
	
	def unvalidate
		@company = Company.find(params[:id])
		@company.is_validated = false
		@company.save
		redirect_to companies_path
	end

	def update
		@company = Company.find(params[:id])
		@company.update_attributes(companies_params)
		redirect_to companies_dashboard_path
	end

	# here we use the join method to generate the PDF.
	# since we don't really need to show information from a company via a HTML page we redirect to the root of the app
	# if we reach the PDF format of the route then it generates the PDF with the help of the CompanyPdf class.
	def show
		@company = Company.find(params[:id])
		respond_to do |format|
			format.html do
				redirect_to root_path
			end
			format.pdf do
				pdf = CompanyPdf.new(@company)
				send_data pdf.render,	filename: "informacion_#{@company.company_name}.pdf",
					type: "application/pdf",
					disposition: "inline"
			end
		end
	end

	private
	def is_admin
		if current_user.roleable_type == "Admin"
			true
		else
			false
		end
	end

	def companies_params
		params.require(:company).permit(:company_name, :contact_first_name, :contact_last_name, :contact_last_m_name, :contact_employement )
	end
end
