class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
			t.string :name
			t.string :username
			t.string :phone
			t.string :company_id
			t.string :email
			t.string :position
			t.string :password_digest
			t.integer :role_id
      t.timestamps
    end
  end
end
