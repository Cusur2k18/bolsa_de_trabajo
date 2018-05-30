class CoursesController < ApplicationController
	before_action :authenticate_user!
	before_action :is_student
	def index
		@courses = current_user.roleable.courses 
	end

	def new
		@course = Course.new
	end

	def create
		@course  = Course.new(courses_params)
		@user  = current_user.roleable
		@user.courses << @course
		if @course.save
			flash[:notice] = "La entrada ha sido guardada correctamente"	
			redirect_to courses_path
		else
			flash[:alert] = "Algo salio mal a la hora de guardar la entrada, verifique los datos ingresados"
			render :new
		end
	end

	def edit
		@course = Course.find(params[:id])
		if is_owner(@course)
			@course
		else
			flash[:alert] = "No puedes acceder a una entrada que no es de tu propiedad"
			redirect_to root_path
		end
	end


	def update
		@course = Course.find(params[:id])
		if is_owner(@course)
			if @course.update_attributes(courses_params)
				flash[:notice] = "Se ha actualizado la entrada correctamente"
				redirect_to courses_path
			else
				flash[:alert] = "Algo salio mal a la hora de actualizar la entrada, verifique los datos ingresados"
				render :edit
			end
		else
			flash[:alert] = "No puedes acceder a una entrada que no es de tu propiedad"
			redirect_to root_path
		end

	end

	def destroy
		@course = Course.find(params[:id])
		if is_owner(@course)
			@course.delete
			flash[:notice] = "La entrada se elimino correctamente"
			redirect_to courses_path

		else
			flash[:notice] = "No puedes borrar una entrada que no es de tu propiedad"
			redirect_to root_path

		end
	end

	private
	def courses_params
		params.require(:course).permit(:name, :description, :issuing_organism, :start_date, :end_date)
	end

	def is_student
		if current_user.roleable_type == "Student"
			true
		else
			flash[:alert] = t('warnings.un_authorized_access')
			redirect_to root_path
		end
	end

	def is_owner(course)
		if current_user.roleable.id == course.student_id
			true
		else
			false
		end
	end
end
