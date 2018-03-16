class JobsController < ApplicationController
	before_action :authenticate_user!
	before_action :is_company

	def index
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(jobs_params)
		@company = current_user.roleable
		@company.jobs << @job
		if @job.save
			redirect_to jobs_path
		else
			flash[:alert] = t('warnings.something_went_wrong')
			render :new 
		end
	end

	private
	def is_company
		if current_user.roleable_type == "Company"
			true
		else
			flash[:alert] = t('warnings.un_authorized_access')
			redirect_to root_path
		end
	end

	def jobs_params
		params.require(:job).permit(:category, :workday_schedule, :contract_type, :salary, :name, :age_requierement, :gender, :schooling_level, :work_experience, :specialized_knowledge, :aptitudes, :job_duration, :workday_type)
	end
end
