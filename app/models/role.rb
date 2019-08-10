class Role < ApplicationRecord
	has_many :users
	validates :role, uniqueness: true
	validates :role, presence: true
end
