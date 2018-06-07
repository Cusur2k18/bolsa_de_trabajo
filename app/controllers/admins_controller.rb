class AdminsController < ApplicationController
	def edit
		if current_user.roleable.id == Admin.find(params[:id]).id
			@admin = Admin.find(params[:id])
		else
			flash[:warning] = "No puedes editar este usuario"
			redirect_to root_path
		end
	end

	def update
		@admin = Admin.find(params[:id])
		if @admin.update_attributes(admin_params)
			flash[:notice] = "Los datos han sido actualizados correctamente"
			redirect_to admin_dashboard_path
		else
			flash[:warning] = "Verifica que todos los datos ingresados sean correctos"
			render :edit
		end
	end 

	private
	def admin_params
		params.require(:admin).permit(:name, :last_name, :last_m_name)
	end
end
