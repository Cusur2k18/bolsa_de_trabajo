class StudentsController < ApplicationController
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

	def delete
	end

	private

	def is_logged_user
		current_user.roleable.id
	end

	def student_params
		params.require(:student).permit(:first_name, :last_name, :last_m_name, :udg_code, :state, :user_attributes => [:email, :password, :password_confirmation])
	end

end
