class User < ApplicationRecord
	has_many :requests
	belongs_to :role
	belongs_to :company

	has_secure_password

	validates :password, :email, :name, :username, :role, :company, presence: true
	validates :email, :username, uniqueness: true

end
