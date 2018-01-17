class EducationsController < ApplicationController
	def index
		s = Student.find(current_student.id)
		@degrees = s.educations
	end

	def new
		@education = Education.new
	end

	def create
		@education = Education.create(education_params)
		if @education.save
			redirect_to educations_path
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def education_params
		params.require(:education).permit(:university,
										  :education_level,
										  :major,
										  :admission_date,
										  :graduation_date,
										  :student_id)
	end
end
