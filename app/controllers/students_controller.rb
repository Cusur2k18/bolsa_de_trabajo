class StudentsController < ApplicationController
	def index
		redirect_to root_path
	end

	def new
		super
	end

	def create
		@student = Student.create(params[:student_params])
		if @student.save?
			redirect_to root_path
		else
			render :new
		end
	end

	private

	def student_params
		params.require(:student).permit(:first_name, :last_name, :last_m_name, :udg_code, :state, :user_attributes => [:email, :password, :password_confirmation])
	end

end
