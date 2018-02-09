class Student < ApplicationRecord
	has_one :user, as: :roleable
	has_many :educations, dependent: :destroy
	accepts_nested_attributes_for :user
end
