class AddColumnToRequest < ActiveRecord::Migration[5.2]
	def change
		add_column :requests, :owner_id, :integer
		add_column :requests, :analyst_id, :integer
  end
end
