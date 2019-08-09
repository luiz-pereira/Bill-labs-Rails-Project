class Communication < ApplicationRecord
	belongs_to :sender_user, class_name: 'User'
	belongs_to :receiver_user, class_name: 'User'
	belongs_to :request

	validates :sender_user, :receiver_user, :content, presence: true

end
