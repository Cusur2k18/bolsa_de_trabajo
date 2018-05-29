class Language < ApplicationRecord
	belongs_to :student
	enum has_certificate: [ :Si, :No ]

	validates_presence_of :name, :language_level, :has_certificate
end
