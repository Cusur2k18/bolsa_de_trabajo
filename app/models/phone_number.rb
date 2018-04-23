class PhoneNumber < ApplicationRecord
	belongs_to :user
	validates_presence_of :cell_phone_number, :home_phone_number
end
