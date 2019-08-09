class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
			t.string :name
			t.string :financial_situation
			t.integer :sector_id
      t.timestamps
    end
  end
end
