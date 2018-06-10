class AdminsDashboardController < ApplicationController
	def index
		@user = current_user
		@admin = current_user.roleable
	end
end
