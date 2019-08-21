class Addcolumntoproduct < ActiveRecord::Migration[5.2]
	def change
		add_column :products, :market_price, :float
  end
end
