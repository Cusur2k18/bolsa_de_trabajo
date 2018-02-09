class Admin < ApplicationRecord
	has_one :user, as: :roleable
	accepts_nested_attributes_for :user
end
