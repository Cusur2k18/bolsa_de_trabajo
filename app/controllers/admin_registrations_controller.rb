class AdminRegistrationsController < ApplicationController


	# if the app doesn't have any admins then we can create a new admin user without having to log in.
	# if at least 1 admin exist though we need to be logged in as admin to create a new admin user
	def new
		if Admin.all.empty?
			@admin = Admin.new
			@user = User.new
		else 
			if !current_user.nil? and is_admin
				@admin = Admin.new
				@user = User.new
			else
				flash[:notice] = "No tienes los permisos necesarios para acceder a esta ruta"
				redirect_to root_path
			end
		end
	end

	def create
		@user = User.new(user_params)
		@admin = Admin.new
		@admin.name = params[:name]
		@admin.last_name = params[:last_name]
		@admin.last_m_name = params[:last_m_name]

		if @admin.save
			@user.roleable = @admin
			@user.save

			flash[:notice] = "Se ha registrado el nuevo administrador, para utilizaro da click en salir e ingresa con el nuevo usuario"
			redirect_to root_path

		else
			flash[:notice] = "Algo salio mal al registrar el nuevo administrador"
			render :new
		end

	end

	private

	def user_params 
		params.require(:user).permit(:email, :password, :password_confirmation)
	end

	def is_admin
		if current_user.roleable_type == "Admin"
			true
		else
			false
		end
	end

end
