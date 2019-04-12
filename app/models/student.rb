class Student < ApplicationRecord

	has_one :user, as: :roleable, dependent: :destroy
	has_many :educations, dependent: :destroy
	has_many :job_applications, dependent: :destroy
	has_many :interviews, dependent: :destroy
	has_many :former_jobs, dependent: :destroy
	has_many :academic_awards, dependent: :destroy
	has_many :languages, dependent: :destroy
	has_many :courses, dependent: :destroy

	enum academic_level: [ :'Licenciatura', :'Maestría', :'Doctorado' ]
	enum state: [ :'Sin empleo', :'En proceso', :'Contratado por bolsa de trabajo', :'Contratado externamente' ]
	enum civil_status: [ :'Soltero', :'Casado', :'Viudo', :'Divorciado' ]
	enum genre: [ :'Masculino', :'Femenino', :'Prefiero no decirlo' ]

	validates_presence_of :first_name, :last_name, :last_m_name,  :udg_code, :civil_status, :genre, :born_date, :academic_level
	validates :terms_of_service, acceptance: { accept: 'yes' }

	#sets default state to students since all new students will be unemployed
	before_save :set_default_state, on: :create

	def set_default_state
		if self.new_record?
			self.state ||= Student.states.key(0)
		end
	end

end
