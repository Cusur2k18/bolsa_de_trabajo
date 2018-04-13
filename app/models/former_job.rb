class FormerJob < ApplicationRecord
	belongs_to :student
	enum is_current_job: [ :si, :no ]
	validates_presence_of :enterprise_name, :phone_number, :address, :boss_name, :job_title, :first_paycheck, :last_paycheck, :is_current_job
end
