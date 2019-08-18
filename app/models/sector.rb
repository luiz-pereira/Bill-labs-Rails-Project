class Sector < ApplicationRecord
	has_many :companies

	validates :sector, uniqueness: true
	validates :sector, presence: true

end
