class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable
	belongs_to :roleable, polymorphic: true, dependent: :destroy

	has_one :address
	has_many :phone_numbers
end
