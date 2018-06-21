class AddressesController < ApplicationController
	before_action :authenticate_user!
	def index
		@address = current_user.address
	end

	def new
		@address = Address.new
	end

	def create
		@address = current_user.build_address(addresses_params)
		if @address.save
			flash[:notice] = "Se ha actualizado la entrada correctamente"
			redirect_to addresses_path
		else
			flash[:alert] = "Algo salio mal a la hora de actualizar la entrada, verifique los datos ingresados"
			redirect_to new_address_path 
		end
	end

	def edit
		@address= Address.find(params[:id])
		if current_user.id == @address.user_id
			@address
		else
			redirect_to addresses_path
		end
	end

	def update
		@address = Address.find(params[:id])
		if current_user.id == @address.user_id
			if @address.update_attributes(addresses_params)
				flash[:notice] = "Se ha actualizado la entrada correctamente"
				redirect_to addresses_path
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
		@address = Address.find(params[:id])
		if current_user.id == @address.user_id
			@address.delete
			redirect_to addresses_path
		else
			redirect_to addresses_path
		end
	end

	def get_first_time_setup
		@address = Address.new
	end

	def post_first_time_setup
		@address = current_user.build_address(addresses_params)
		if @address.save
			redirect_to phone_numbers_first_time_setup_path
		else
			flash[:alert] = "Algo salio mal a la hora de guardar la entrada, verifique los datos ingresados"
			redirect_to addresses_first_time_setup_path 
		end
	end

	private

	def addresses_params
		params.require(:address).permit(:state, :city, :zip_code, :street, :street_address, :apartment_number)
	end

end
