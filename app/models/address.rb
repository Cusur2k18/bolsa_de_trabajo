class Address < ApplicationRecord
	belongs_to :user
	validates_presence_of :state, :city, :zip_code, :street, :street_address, :apartment_number
end
