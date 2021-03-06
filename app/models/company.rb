class Company < ApplicationRecord
	has_one :user, as: :roleable, dependent: :destroy
	has_many :jobs, dependent: :destroy

	validates_presence_of :company_name, :contact_first_name, :contact_last_name, :contact_last_m_name, :contact_employement, :foundation_date, :rfc, :category
	before_save :set_default_validation, on: :create

	enum category: [ :matriz, :sucursal ]

	def set_default_validation
		if self.new_record?
			self.is_validated ||= false
		end
	end
end
