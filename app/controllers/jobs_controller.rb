class JobsController < ApplicationController
	before_action :authenticate_user!
	before_action :is_company

	def index
		@company = current_user.roleable
		@jobs = Job.where(company_id: @company.id)
		@htmlClass = "myTr"
		@area = ""
	end

	def new
		if current_user.roleable.is_validated
			@job = Job.new
		else
			flash[:notice] = 'Su empresa necesita estar validada primero, contáctese con el administrador del sitio para realizar el trámite de validación enviando un correo electrónico a: clara.rivera@cusur.udg.mx'
			redirect_to jobs_path
		end
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
		if is_owner(@job)
			@job
			@jobTypes = ""
		else
			flash[:alert] = "No se ha podido acceder a esta vacante"
			redirect_to jobs_path
		end
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
			@job.job_types.clear
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
		if job.company_id == current_user.roleable.id
			true
		else
			false
		end
	end

	def jobs_params
		params.require(:job).permit( :workday_schedule_start, :workday_schedule_end, :contract_type, :salary, :name, :age_requierement, :gender, :civil_status, :schooling_level, :work_experience, :specialized_knowledge, :aptitudes, :job_duration, :workday_type, job_type_ids: [])
	end
end
