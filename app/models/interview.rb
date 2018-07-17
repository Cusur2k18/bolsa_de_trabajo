class Interview < ApplicationRecord
	validates_presence_of :date, :hour, :minute, :timezone
	belongs_to :job
	belongs_to :student

	enum status: [:Completada, :Pendiente]
	enum timezone: [:'UTC-5', :'UTC-6', :'UTC-7', :'UTC-8']
end
