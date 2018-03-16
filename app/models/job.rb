class Job < ApplicationRecord
	belongs_to :company
	has_many :job_applications

	enum workday_type: [ :matituno, :vespertino, :nocturno, :mixto ]
	enum genre: [ :masculino, :femenino, :otro]
	
	validates_presence_of :category, :workday_schedule_start, :workday_schedule_end, :contract_type, :workday_type, :salary, :name, :age_requierement, :gender, :schooling_level, :work_experience, :specialized_knowledge, :aptitudes, :job_duration
end

