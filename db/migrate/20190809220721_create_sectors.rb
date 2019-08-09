class CreateSectors < ActiveRecord::Migration[5.2]
  def change
    create_table :sectors do |t|
			t.string :sector
      t.timestamps
    end
  end
end
