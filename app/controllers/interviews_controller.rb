class InterviewsController < ApplicationController
	def index
		if current_user.roleable_type == "Company"
			@jobs = current_user.roleable.jobs
			@counter = 1
		else
			@company = Company.all
		end
	end

	def new
		@hour_c = hour_collection
		@minute_c = minute_collection
		@interview = Interview.new
	end

	def create
		@interview = Interview.new(interviews_params)
		@job = Job.find(params[:jid])
		@student = Student.find(params[:sid])
		@interview.student_id = @student.id
		@interview.job_id = @job.id
		@interview.status = "Pendiente"
		if @interview.save
			flash[:notice] = "Se ha creado la entrevista correctamente."
			redirect_to interviews_path
		else
			flash[:alert] = "Verifica que todos los datos sean correctos."
			render :new
		end
	end

	def show
		@interview = Interview.find(params[:id])
		if is_owner(@interview)
			@interview
		end
		flash[:alert] = "No puedes ver una entrevista que no es tuya."
		redirect_to interviews_path
	end

	def edit
		@interview = Interview.find(params[:id])
		if is_owner(@interview)
			@interview
		end
		flash[:alert] = "No puedes modificar una entrevista que no es tuya."
	end

	def update
		@interview = Interview.find(params[:id])
		if is_owner(@interview)
			if @interview.update_attributes(interviews_params)
				flash[:notice] = "Se ha actualizado correctamente la entrada."
				redirect_to interviews_path
			else
				flash[:alert] = "Algo salio mal al actualizar la entrada, verifique los datos."
				render :edit
			end
		else

			flash[:alert] = "No puedes actualizar una entrada que no es tuya."
			redirect_to root_path
		end
	end

	def destroy
	end

	private

	def interviews_params
		params.require(:interview).permit(:date, :hour, :minute, :timezone, :student_id, :job_id)
	end

	def hour_collection
		hour = []
		counter = 1
		while counter < 24
			hour << counter
			counter = counter+1
		end
		hour
	end

	def minute_collection
		minute = []
		counter = 1
		while counter < 60
			minute << counter
			counter = counter+1
		end
		minute
	end

	def is_owner(interview)
		if current_user.roleable.id == interview.company_id || current_user.roleable == "Admin"
			true
		else
			false
		end
	end

end
