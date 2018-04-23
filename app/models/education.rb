class Education < ApplicationRecord
	belongs_to :student

	enum professional_license_type: [ :No, :Federal, :Estatal, :Ambas ]
	validates_presence_of :university, :education_level, :major, :graduation_date, :admission_date, :professional_license_type
end
