class Student < ApplicationRecord
	has_one :user, as: :roleable
	has_many :educations, dependent: :destroy
	enum state: [ :unemployed, :pending, :employed ]

	validates_presence_of :first_name, :last_name, :last_m_name, :state, :udg_code
end
