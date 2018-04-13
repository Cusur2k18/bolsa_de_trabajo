class JobsController < ApplicationController
	before_action :authenticate_user!
	before_action :is_company

	def index
		@company = current_user.roleable
		@jobs = Job.where(company_id: @company.id)
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(jobs_params)
		@company = current_user.roleable
		@company.jobs << @job
		if @job.save
			flash[:notice] = "Se ha guardado correctamente la vacante"
			redirect_to jobs_path
		else
			flash[:alert] = t('warnings.something_went_wrong')
			render :new 
		end
	end

	def show
		@job = Job.find(params[:id])
	end


	def edit
		@job = Job.find(params[:id])
		if is_owner(@job)
			@job
		else
			flash[:alert] = "No se ha podido editar esta vacante"
			redirect_to jobs_path
		end
	end

	def update
		@job = Job.find(params[:id])
		if is_owner(@job)
			@job.update_attributes(jobs_params)
			flash[:notice] = "Se ha actualizado correctamente la vacante"
			redirect_to jobs_path
		else
			flash[:alert] = "No se ha podido actualizar esta vacante"
			redirect_to jobs_path
		end
	end

	def destroy
		@job = Job.find(params[:id])
		if is_owner(@job)
			@job.delete
			flash[:notice] = "Se ha borrado la vacante correctamente"
			redirect_to jobs_path
		else
			flash[:alert] = "No puedes borrar una vacante que no es tuya"
			redirect_to jobs_path
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

	def is_owner(job)
		if job.company_id == current_user.id
			true
		else
			false
		end
	end

	def jobs_params
		params.require(:job).permit(:category, :workday_schedule_start, :workday_schedule_end, :contract_type, :salary, :name, :age_requierement, :gender, :schooling_level, :work_experience, :specialized_knowledge, :aptitudes, :job_duration, :workday_type)
	end
end
