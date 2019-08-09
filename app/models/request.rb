class Request < ApplicationRecord
	belongs_to :company
	belongs_to :admin_user, class_name: 'User'
	belongs_to :status
	has_many :documents
	has_many :communications
	has_many :logs
	has_many :users, through: :companies
	has_many :products, through: :products_requests

end
