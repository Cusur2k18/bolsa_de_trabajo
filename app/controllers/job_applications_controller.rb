class JobApplicationsController < ApplicationController
	def student_applied
		@student = current_user.roleable
		@job = Job.find(params[:id])
		@job_application = JobApplication.new
		@job_application.student_id = @student.id
		@job_application.job_id = @job.id
		@job_application.status = "No contratado"
		if @job_application.save
			flash[:notice] = "Haz aplicado para el trabajo"
			redirect_to see_jobs_path 
		end
	end

	def student_unapplied
		@job_application = JobApplication.find(params[:id])
		if @job_application.student_id == current_user.roleable.id
			@job_application.delete
			flash[:notice] = "Listo, ya no estas aplicando para ese puesto"
			redirect_to see_jobs_path
		else
			flash[:notice] = "No puedes desaplicar para un trabajo que no haz aplicado"
			redirect_to see_jobs_path
		end
	end
	
	def company_hired
		@job_application = JobApplication.find(params[:id])
		if @job_application.job.company_id == current_user.roleable.id
			@job_application.status = "Contratado"
			flash[:notice] = "Se ha contratado correcamente al egresado!"
			@student = Student.find(@job_application.student_id)
			@student.state = 2
			@student.save
			redirect_to jobs_path
		else
			flash[:notice] = "No puedes acceder a esta pagina" 
		end
	end
end
