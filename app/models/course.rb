class Course < ApplicationRecord
	belongs_to :student

	validates_presence_of :name, :description, :issuing_organism, :start_date, :end_date
end
