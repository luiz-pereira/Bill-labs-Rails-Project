class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
			t.integer :status_id
			t.integer :admin_user_id
			t.integer :company_id
      t.timestamps
    end
  end
end
