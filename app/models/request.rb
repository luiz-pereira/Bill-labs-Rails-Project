class Request < ApplicationRecord
	belongs_to :company
	belongs_to :analyst, class_name: 'User', foreign_key: 'analyst_id', optional: true
	belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
	belongs_to :status
	has_many :documents
	has_many :communications
	has_many :logs
	has_many :users, through: :company
	belongs_to :product

end
