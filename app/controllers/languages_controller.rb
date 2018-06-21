class LanguagesController < ApplicationController
	before_action :authenticate_user!
	before_action :is_student
	def index
		@languages = current_user.roleable.languages
	end

	def new
		if is_student
			@language = Language.new
		else
			redirect_to root_path
		end
	end

	def create
		@language = Language.new(languages_params)
		@student = current_user.roleable
		@student.languages << @language

		if @language.save
			flash[:notice] = "Se ha insertado el idioma correctamente"
			redirect_to languages_path
		else
			flash[:alert] = "Algo salio mal al tratar de insertar el idioma, verifique que los datos sean correctos"
			render :new
		end
	end

	def show
	end

	def edit
		@language = Language.find(params[:id])
		if is_owner(@language)
			@award

		else
			flash[:alert] = "No puedes acceder a una entrada que no es de tu propiedad"
			redirect_to languages_path 

		end
	end

	def update
		@language = Language.find(params[:id])
		if is_owner(@language)
			if @language.update_attributes(languages_params)
				flash[:notice] = "La entrada  ha sido actualizada correctamente"
				redirect_to languages_path
			else
				flash[:alert] = "Algo salio mal al tratar de actualizar la entrada, verifique que todos los datos sean correctos"
				render :edit
			end
		else
			flash[:notice] = "No puedes editar una entrada que no es de tu propiedad"
			redirect_to languages_path 
		end
	end

	def destroy
		@language = Language.find(params[:id])
		if is_owner(@language)
			@language.delete
			redirect_to languages_path
		else
			flash[:notice] = "No puedes borrar una entrada que no es de tu propiedad" 
			redirect_to languages_path
		end
	end

	def get_first_time_setup
		if is_student
			@language = Language.new
		else
			redirect_to root_path
		end
	end

	def post_first_time_setup
		@language = Language.new(languages_params)
		@student = current_user.roleable
		@student.languages << @language

		if @language.save
			flash[:notice] = "Se ha configurado correctamente tu información, bienvenido a tu perfil."
			redirect_to student_dashboard_path
		else
			flash[:alert] = "Algo salio mal al tratar de insertar el idioma, verifique que los datos sean correctos"
			render :get_first_time_setup
		end
	end

	private

	def languages_params
		params.require(:language).permit(:name, :language_level, :has_certificate, :issuing_organism) 
	end

	def is_student
		if current_user.roleable_type == "Student"
			true
		else
			flash[:alert] = t('warnings.un_authorized_access')
			redirect_to root_path
		end
	end

	def is_owner(language)
		if current_user.roleable.id == language.student_id
			true
		else
			false
		end
	end
end
