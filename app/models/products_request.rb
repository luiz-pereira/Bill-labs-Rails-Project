class ProductsRequest < ApplicationRecord
	belongs_to :product
	belongs_to :request
end