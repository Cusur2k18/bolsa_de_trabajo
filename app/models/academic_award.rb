class AcademicAward < ApplicationRecord
	belongs_to :student

	validates_presence_of :name, :description, :issuing_organism, :award_date
end
