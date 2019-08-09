class CreateCommunications < ActiveRecord::Migration[5.2]
  def change
    create_table :communications do |t|
			t.string :content
			t.integer :sender_user_id
			t.integer :receiver_user_id
			t.integer :request_id
      t.timestamps
    end
  end
end
