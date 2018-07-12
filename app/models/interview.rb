class Interview < ApplicationRecord
	validates_presence_of :date, :hour
	belongs_to :job
	belongs_to :student

	enum status: [:Completada, :Pendiente]
end
