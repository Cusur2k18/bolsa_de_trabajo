class EducationsController < ApplicationController
	def index
		@student = current_user.roleable
		@educations = Education.where(student_id: @student.id)
	end


	def new
		@education = Education.new
	end

	def create
		@student = current_user.roleable
		@education = Education.new(educations_params)
		@student.educations << @education
		if @education.save
			redirect_to student_dashboard_path
		else
			render :new
		end
	end

	private

	def educations_params
		params.require(:education).permit(:university, :education_level, :major, :admission_date, :graduation_date )
	end

end
