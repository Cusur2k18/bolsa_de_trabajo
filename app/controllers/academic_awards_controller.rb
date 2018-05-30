class AcademicAwardsController < ApplicationController
	before_action :authenticate_user!
	before_action :is_student
	def index
		@awards = current_user.roleable.academic_awards
	end

	def new
		@award = AcademicAward.new
	end

	def create
		@award = AcademicAward.new(academic_awards_params)
		@user = current_user.roleable	
		@user.academic_awards << @award

		if @award.save
			flash[:notice] = "Se ha guardado correctamente la entrada"
			redirect_to academic_awards_path

		else
			flash[:alert] = "Algo salio mal a la hora de guardar la entrada, verifique los datos ingresados"
			render :new

		end
	end

	def show
		@award = AcademicAward.find(params[:id])

		if is_owner(@award)
			@award

		else
			flash[:alert] = "No puedes acceder a una entrada que no es de tu propiedad"
			redirect_to root_path 

		end
	end

	def edit
		@award = AcademicAward.find(params[:id])

		if is_owner(@award)
			@award

		else
			flash[:alert] = "No puedes acceder a una entrada que no es de tu propiedad"
			redirect_to root_path

		end
	end

	def update
		@award = AcademicAward.find(params[:id])

		if is_owner(@award)
			if	@award.update_attributes(academic_awards_params)
				flash[:notice] = "Se ha actualizado la entrada correctamente"
				redirect_to academic_awards_path

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
		@award = AcademicAward.find(params[:id])

		if is_owner(@award)	
			@award.delete
			flash[:notice] = "La entrada se elimino correctamente"
			redirect_to academic_awards_path

		else
			flash[:notice] = "No puedes borrar una entrada que no es de tu propiedad"
			redirect_to root_path

		end
	end

	private
	def is_student
		if current_user.roleable_type == "Student"
			true
		else
			flash[:alert] = t('warnings.un_authorized_access')
			redirect_to root_path
		end
	end


	def academic_awards_params
		params.require(:academic_award).permit(:name, :field, :description, :issuing_organism, :award_date)
	end

	def is_owner(award)
		if current_user.roleable.id == award.student_id
			true
		else
			false
		end
	end
end
