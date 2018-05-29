class AcademicAward < ApplicationRecord
	belongs_to :student

	validates_presence_of :name, :field, :description, :issuing_organism, :award_date
end
