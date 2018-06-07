class AdminRegistrationsController < ApplicationController
	def new
		@admin = Admin.new
		@user = User.new
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
			redirect_to admin_dashboard_path 

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
