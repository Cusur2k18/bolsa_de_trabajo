class Education < ApplicationRecord
	belongs_to :student
	enum education_level: [:Licenciatura, :Maestria, :Doctorado]
end
