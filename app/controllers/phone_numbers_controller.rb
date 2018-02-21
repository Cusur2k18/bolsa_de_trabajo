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
			redirect_to :back
		else
			render :new
		end

	end

	private

	def phone_numbers_params

	end
end
