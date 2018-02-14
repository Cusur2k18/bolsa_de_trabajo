class Company < ApplicationRecord
	has_one :user, as: :roleable

	validates_presence_of :company_name, :contact_first_name, :contact_last_name, :contact_employement, :is_validated
end
