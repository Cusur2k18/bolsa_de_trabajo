class JobApplicationsController < ApplicationController
	def student_applied
		# this entire class is a custom controller, it doesn't use the usual index, new, create, show, edit, update and delete methods
		# but custom methods via custom routes, you can see the routes in the routes.rb class
	
		# if the student applies for a job you get the ID of the job it applies for and create a JobAppplication record obtaining
		# the ID of the current user and the ID of the Job
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

	# if an students unapplies for that said job then we just delete the record.
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

	# if the company decides to hire the student then we only update the status of the JobApplication record
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
