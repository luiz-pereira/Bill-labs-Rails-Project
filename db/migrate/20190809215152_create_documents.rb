class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
			t.integer :request_id
			t.string :document_name
			t.binary :document
      t.timestamps
    end
  end
end
