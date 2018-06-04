class JobType < ApplicationRecord
	has_and_belongs_to_many :jobs, dependent: :destroy
	validates_presence_of :area
end
