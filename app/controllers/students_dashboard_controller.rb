class StudentsDashboardController < ApplicationController
	def index
		@user = current_user
	end

	def show
		@student = Student.find(params[:id])
	end
end
