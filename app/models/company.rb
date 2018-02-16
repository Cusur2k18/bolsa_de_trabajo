class Company < ApplicationRecord
	has_one :user, as: :roleable

	validates_presence_of :company_name, :contact_first_name, :contact_last_name, :contact_last_m_name, :contact_employement
	before_save :set_default_validation, on: :create


	def set_default_validation
		if self.new_record?
			self.is_validated ||= false
		end
	end
end
