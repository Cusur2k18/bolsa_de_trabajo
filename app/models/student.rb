class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :terms_of_service, acceptance: {message: 'Debes de aceptar términos para utilizar el servicio' }
  has_many :educations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum state: [:desempleado, :proceso, :contratado]
end
