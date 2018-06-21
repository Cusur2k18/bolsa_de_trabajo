class PhoneNumbersController < ApplicationController
	before_action :authenticate_user!
	def index
		@phone_numbers = current_user.phone_numbers
	end

	def new
		@phone_number = PhoneNumber.new
	end

	def create
		@phone_number = PhoneNumber.new(phone_numbers_params)
		@user = current_user
		@user.phone_numbers << @phone_number
		if @phone_number.save
			redirect_to phone_numbers_path 
		else
			render :new
		end

	end

	def edit
		@phone_number = PhoneNumber.find(params[:id])
		if @phone_number.user_id == current_user.id
			@phone_number
		else
			redirect_to phone_numbers_path 
		end
	end

	def update
		@phone_number = PhoneNumber.find(params[:id])
		if @phone_number.user_id == current_user.id
			@phone_number.update_attributes(phone_numbers_params)
			redirect_to phone_numbers_path
		else
			redirect_to phone_numbers_path
		end
	end

	def destroy
		@phone_number = PhoneNumber.find(params[:id])
		if @phone_number.user_id == current_user.id
			@phone_number.delete
			redirect_to phone_numbers_path
		else
			redirect_to phone_numbers_path
		end

	end

	def get_first_time_setup
		@phone_number = PhoneNumber.new
	end

	def post_first_time_setup
		@phone_number = PhoneNumber.new(phone_numbers_params)
		@user = current_user
		@user.phone_numbers << @phone_number
		if @phone_number.save
			if current_user.roleable_type == "Student"
				redirect_to educations_first_time_setup_path
			else
				redirect_to jobs_first_time_setup_path
			end

		else
			flash[:alert] = "Algo salio mal a la hora de guardar la entrada, verifique los datos ingresados"
			redirect_to phone_numbers_first_time_setup_path
		end
	end
	private

	def phone_numbers_params
		params.require(:phone_number).permit(:cell_phone_number, :home_phone_number)
	end
end
