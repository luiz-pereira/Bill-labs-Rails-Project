class CreateJoinTableProductsRequests < ActiveRecord::Migration[5.2]
  def change
    create_join_table :products, :requests do |t|
    	t.index [:request_id, :product_id]
    end
  end
end
