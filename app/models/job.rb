class Job < ApplicationRecord
	belongs_to :company
	has_many :job_applications
	has_many :interviews

	has_and_belongs_to_many :job_types

	enum workday_type: [ :matituno, :vespertino, :nocturno, :mixto ]
	enum gender: [ :masculino, :femenino, :unisex ]
	enum civil_status: [ 'No Aplica', 'Soltero', 'Casado' ]
	
	validates_presence_of  :workday_schedule_start, :workday_schedule_end, :contract_type, :workday_type, :salary, :name, :age_requierement, :gender, :civil_status, :schooling_level, :work_experience, :specialized_knowledge, :aptitudes, :job_duration

end

