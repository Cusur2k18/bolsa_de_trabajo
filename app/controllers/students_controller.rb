class StudentsController < ApplicationController
	def index
		if is_admin
			@students = Student.all
		else
			flash[:notice] = "No tienes permisos para entrar a esta pagina"
			redirect_to root_path
		end
	end

	def edit
		# validates if the user wanting to edit the data is the user that is signed in 
		if is_logged_user == Student.find(params[:id]).id
			@student = Student.find(params[:id])
		else 
			redirect_to root_path
		end
	end

	def update
		@student = Student.find(params[:id])
		@student.update_attributes(student_params)
		redirect_to student_dashboard_path
	end

	def show
		@student = Student.find(params[:id])
		respond_to do |format|
			format.html do
				if  !is_admin
					redirect_to root_path
				end
				@student
			end
			format.pdf do
				pdf = StudentPdf.new(@student)
				send_data pdf.render,	filename: "curriculum_#{@student.first_name}.pdf",
					type: "application/pdf",
					disposition: "inline"
			end
		end
	end

	def delete
	end

	private
	def is_admin
		if current_user.roleable_type == "Admin"
			true
		else
			false
		end
	end

	def is_logged_user
		current_user.roleable.id
	end

	def student_params
		params.require(:student).permit(:first_name, :last_name, :last_m_name, :udg_code, :state, :acedemic_level, :terms_of_service, :curp, :travel_available, :relocate_available, :office_software, :user_attributes => [:email, :password, :password_confirmation])
	end

end
