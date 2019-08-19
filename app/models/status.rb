class Status < ApplicationRecord
	has_many :requests

	def next_status_id
		(status == 'Finished') ? self.id : self.id + 1
	end

	def previous_status_id
		(status == 'New') ? self.id : self.id - 1
	end

end
