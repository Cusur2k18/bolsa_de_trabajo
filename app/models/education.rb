class Education < ApplicationRecord
	belongs_to :student

	validates_presence_of :university, :education_level, :major, :graduation_date, :admission_date 
end
