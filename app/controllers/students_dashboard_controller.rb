class StudentsDashboardController < ApplicationController
	before_action :authenticate_user!
	def index
		@user = current_user
		@student = current_user.roleable
	end

	def show
		@student = Student.find(params[:id])
	end
end
