class AddressesController < ApplicationController
	before_action :authenticate_user!
	def index
		@address = current_user.address
	end

	def new
		@address = Address.new
	end

	def create
		@address = Address.new(addresses_params)
		@user = current_user
		@user.address = @address
		if @address.save
			redirect_to addresses_path
		else
			render :new
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
			@address.update_attributes(addresses_params)
			redirect_to addresses_path
		else
			redirect_to addresses_path
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

	private

	def addresses_params
		params.require(:address).permit(:state, :city, :zip_code, :street, :street_address, :apartment_number)
	end

end
