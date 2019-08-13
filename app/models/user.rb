class User < ApplicationRecord
	has_many :requests
	belongs_to :role
	belongs_to :company, optional: true

	has_secure_password

	validates :password, :email, :name, :username, :role, presence: true
	validates :email, :username, uniqueness: true

	def create_username
		self.name.split(' ').map(&:downcase).join('')
	end

end
