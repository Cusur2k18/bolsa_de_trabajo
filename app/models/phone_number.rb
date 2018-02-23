class PhoneNumber < ApplicationRecord
	belongs_to :user
	validates_presence_of :description, :phone_number
end
