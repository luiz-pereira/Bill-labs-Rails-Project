class Product < ApplicationRecord
	has_many :requests, through: :products_requests
	validates :name, uniqueness: true
	validates :name, presence: true
end
