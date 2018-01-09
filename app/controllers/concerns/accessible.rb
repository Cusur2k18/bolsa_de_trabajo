module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
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
