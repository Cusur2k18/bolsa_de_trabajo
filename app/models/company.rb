class Company < ApplicationRecord
	has_one :user, as: :roleable
	has_many :jobs

	validates_presence_of :company_name, :contact_first_name, :contact_last_name, :contact_last_m_name, :contact_employement, :website, :foundation_date, :rfc, :category
	before_save :set_default_validation, on: :create

	enum category: [ :matriz, :sucursal ]

	def set_default_validation
		if self.new_record?
			self.is_validated ||= false
		end
	end
end
