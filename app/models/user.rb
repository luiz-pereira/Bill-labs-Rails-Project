class User < ApplicationRecord
	has_many :requests
	belongs_to :role
	belongs_to :company, optional: true

	has_secure_password

	validates :email, :name, :username, :role, presence: true
	validates :email, :username, uniqueness: true

	def create_username
		self.name.split(' ').map(&:downcase).join('')
	end

	def self.find_or_create_user_linkedin(auth)
		email = auth[:info][:email]
		@user = self.find_or_create_by(email: email) do |user|
			user.email = auth[:info][:email]
			user.name = auth[:info][:first_name] + ' ' + auth[:info][:last_name]
			user.name = user.name.gsub(/,.*/,'')
			user.username = user.create_username
			# I stopped here. I need to create the company with sector. And create a sector with a sector name.
			@company = Company.find_or_create_by name: auth[:info][:first_name]
			@company.save
			user.company = @company
			user.role = Role.find_by role: 'customer_admin'
			user.password = '123'
			user.linkedin = true
			user.position = 'manager'
		end
		@user.save
		@user
		binding.pry
	end

	def linkedin?
		binding.pry
		self.linkedin
	end
end
