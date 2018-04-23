class Student < ApplicationRecord

	has_one :user, as: :roleable
	has_many :educations, dependent: :destroy
	has_many :job_applications
	has_many :former_jobs

	enum state: [ :desempleado, :proceso, :contratado_por_bolsa_de_trabajo, :contratado_externamente ]
	enum civil_status: [ :soltero, :casado, :viudo, :divorciado ]
	enum genre: [ :masculino, :femenino ]

	validates_presence_of :first_name, :last_name, :last_m_name,  :udg_code, :civil_status, :genre, :born_date

	#sets default state to students since all new students will be unemployed
	before_save :set_default_state, on: :create

	def set_default_state
		if self.new_record?
			self.state ||= Student.states.key(0)
		end
	end

end
