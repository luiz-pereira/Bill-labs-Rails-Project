class Company < ApplicationRecord
	has_many :requests
	has_many :users
	belongs_to :sector

	validates :name, :sector, presence: true
	validates :name, uniqueness: true


end
