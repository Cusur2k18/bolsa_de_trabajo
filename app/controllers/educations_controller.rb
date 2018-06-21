class EducationsController < ApplicationController
	before_action :authenticate_user!
	# basically is_student checks if the logged in user if indeed a student
	# current_student sentence checks if the owner is the one trying to
	# update/delete the data.

	def index
		if is_student
			@student = current_user.roleable
			@educations = Education.where(student_id: @student.id)
		else
			redirect_to root_path
		end
	end


	def new
		if is_student
			@education = Education.new
		else
			redirect_to root_path
		end
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


	def edit
		if is_student
			@education = Education.find(params[:id])
			if current_student == @education.student_id
				@education
			else
				redirect_to student_dashboard_path 
			end
		else
			redirect_to root_path
		end
	end

	def update
		if is_student
			@education = Education.find(params[:id])
			if current_student == @education.student_id
				@education.update_attributes(educations_params)
				redirect_to educations_path 
			else
				redirect_to student_dashboard_path
			end
		else
			redirect_to root_path
		end
	end

	def destroy 
		if is_student
			@education = Education.find(params[:id])
			if current_student == @education.student_id
				@education.delete
				redirect_to educations_path 
			else
				redirect_to :back
			end
		else
			redirect_to root_path
		end
	end

	def get_first_time_setup
		if is_student
			@education = Education.new
		else
			redirect_to root_path
		end
	end

	def post_first_time_setup
		@student = current_user.roleable
		@education = Education.new(educations_params)
		@student.educations << @education
		if @education.save
			redirect_to former_jobs_first_time_setup_path
		else
			redirect_to educations_first_time_setup_path 
		end
	end

	private

	def educations_params
		params.require(:education).permit(:university, :education_level, :major, :admission_date, :graduation_date, :professional_license_type, :certification_date )
	end

	def is_student 
		if current_user.roleable_type == "Student"
			return true
		else
			return false
		end
	end

	def current_student
		current_user.roleable.id
	end

end

