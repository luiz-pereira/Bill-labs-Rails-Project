class Product < ApplicationRecord
	has_many :requests, through: :products_requests
end
