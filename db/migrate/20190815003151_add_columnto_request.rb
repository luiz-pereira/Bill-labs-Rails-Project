class AddColumntoRequest < ActiveRecord::Migration[5.2]
	def change
		add_column :requests, :product_id, :integer
  end
end
