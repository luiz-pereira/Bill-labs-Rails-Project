class Product < ApplicationRecord
	has_many :requests
	has_many :analysts, through: :requests, class_name: 'User'
	validates :name, uniqueness: true
	validates :name, presence: true
end
