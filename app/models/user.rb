class User < ApplicationRecord
	has_many :analyzed_requests, class_name: 'Request', foreign_key: 'analyst_id'
	has_many :owned_requests, class_name: 'Request', foreign_key: 'owner_id'
	belongs_to :role
	belongs_to :company, optional: true

	has_secure_password

	validates :email, :name, :username, :role, presence: true
	validates :email, :username, uniqueness: true

	def create_username
		i = 0
		username = self.name.split(' ').map(&:downcase).join('')
		while User.find_by username: username
			i +=1
			username = username + i.to_s
		end
		username
	end

	def to_param
		username
	end

	def self.find_or_create_user_linkedin(auth)
		email = auth[:info][:email]
		@user = self.find_or_create_by(email: email) do |user|
			user.email = auth[:info][:email]
			user.name = auth[:info][:first_name] + ' ' + auth[:info][:last_name]
			user.name = user.name.gsub(/,.*/,'')
			user.username = user.create_username
			user.company = Company.last #to be changed later
			user.role = Role.find_by role: 'customer_admin' #to be changed later
			user.password = '123'
			user.linkedin = true
			user.position = 'manager' #to be changed later
		end
		@user.save
		@user
	end

	def is_admin?
		role.role.include?("admin")
	end
end
