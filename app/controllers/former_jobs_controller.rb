class FormerJobsController < ApplicationController
	before_action :authenticate_user!
	before_action :is_student

	def index
		@former_jobs = current_user.roleable.former_jobs.all
	end

	def new
		@former_job = FormerJob.new
	end

	def create
		@former_job = FormerJob.new(former_jobs_params)
		@user = current_user.roleable
		@user.former_jobs << @former_job
		if @former_job.save
			flash[:notice] = "Se ha creado correctamente la entrada"
			redirect_to former_jobs_path
		else
			flash[:notice] = "No se pudo guardar la entrada, verifica que todos los datos ingresados sean correctos"
			render :new
		end
	end

	def show
		@former_job = FormerJob.find(params[:id])
		if is_owner(@former_job)
			@former_job
		else
			flash[:notice] = "No puedes ver un trabajo que no es tuyo"
			redirect_to former_jobs_path
		end

	end

	def edit
		@former_job = FormerJob.find(params[:id])
		if is_owner(@former_job)
			@former_job
		else
			flash[:notice] = "No se puede editar esta vacante"
			redirect_to former_jobs_path
		end
	end

	def update
		@former_job = FormerJob.find(params[:id])
		if is_owner(@former_job)
			if @former_job.update_attributes(former_jobs_params)
				flash[:notice] = "Se han actualizado los datos correctamente"
				redirect_to former_jobs_path
			else 
				flash[:notice] = "Verifica que todos los datos sean correctos"
				render :edit
			end
		else
			flash[:alert] = "No puedes actualizar una entrada que no es tuya"
		end
	end

	def destroy
		@former_job = FormerJob.find(params[:id])
		if is_owner(@former_job)
			@former_job.delete
			flash[:notice] = "Se ha borrado correcamente el trabajo"
			redirect_to former_jobs_path
		else
			flash[:alert] = "No puedes borrar un trabajo que no es tuyo"
			redirect_to former_jobs_path
		end
	end

	def get_first_time_setup
		if is_student
			@former_job = FormerJob.new
		else
			redirect_to root_path
		end
	end

	def post_first_time_setup
		if is_student
			@former_job = FormerJob.new(former_jobs_params)
			@user = current_user.roleable
			@user.former_jobs << @former_job
			if @former_job.save
				redirect_to academic_awards_first_time_setup_path
			else
				flash[:notice] = "No se pudo guardar la entrada, verifica que todos los datos ingresados sean correctos"
				redirect_to former_jobs_get_first_time_setup_path
			end
		else
			redirect_to root_path
		end
	end

	private

	def is_student
		if current_user.roleable_type == "Student"
			true
		else
			false
		end
	end

	def is_owner(former_job)
		if former_job.student_id == current_user.roleable.id
			true
		else
			false
		end
	end

	def former_jobs_params
		params.require(:former_job).permit(:enterprise_name, :phone_number, :address, :boss_name, :job_title, :first_paycheck, :last_paycheck, :is_current_job)
	end

end
