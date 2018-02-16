class Student < ApplicationRecord
	has_one :user, as: :roleable
	has_many :educations, dependent: :destroy
	enum state: [ :unemployed, :pending, :employed ]

	validates_presence_of :first_name, :last_name, :last_m_name,  :udg_code

	before_save :set_default_state, on: :create

	def set_default_state
		if self.new_record?
			self.state ||= Student.states.key(0)
		end
	end
end
