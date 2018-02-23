class CompaniesDashboardController < ApplicationController
	before_action :authenticate_user!

	def index
		@user = current_user
		@company = current_user.roleable
	end
end
