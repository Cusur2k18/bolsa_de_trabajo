module Accessible
	extend ActiveSupport::Concern
	included do
		before_action :check_user
	end

	protected

	def is_company
		if current_user.roleable_type == "Company"
			true
		else
			flash[:alert] = t('warnings.un_authorized_access')
			redirect_to root_path
		end

	end

	def is_student
		if current_user.roleable_type == "Student"
			true
		else
			flash[:alert] = t('warnings.un_authorized_access')
			redirect_to root_path
		end
	end

	def check_user
		if current_company
			flash.clear
			# if you have rails_admin. You can redirect anywhere really
			redirect_to(authenticated_company_root_path) && return
		elsif current_student
			flash.clear
			# The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
			redirect_to(authenticated_student_root_path) && return
		end
	end
end	
