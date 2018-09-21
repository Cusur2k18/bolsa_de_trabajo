class JobTypesController < ApplicationController
	before_action :authenticate_user!
	# before_action :is_admin ~ this line is commentated because we are not sure if companies should be able to create JobTypes
	def index
		@job_types = JobType.all
	end

	def new
		@job_type = JobType.new
	end

	def create
		@job_type = JobType.new(job_type_params)
		if @job_type.save
			flash[:notice] = "La entrada ha sido guardada correctamente"
			redirect_to job_types_path
		else
			flash[:warning] = "No se ha podido guardar la entrada, verifica que los datos ingresados sean correctos"
			render :new
		end
	end

	def edit
		@job_type = JobType.find(params[:id])
	end

	def update
		@job_type = JobType.find(params[:id])
		if @job_type.update_attributes(job_type_params)
			flash[:notice] = "La entrada ha sido actualizado correctamente"
			redirect_to job_types_path
		else
			flash[:warning] = "No se ha podido actualizar la entrada, verfica que los datos ingresados sean correctos"
			render :edit
		end
	end

	def delete
		@job_type = JobType.find(params[:id])
	end

	private

	def job_type_params
		params.require(:job_type).permit(:area)
	end
end
