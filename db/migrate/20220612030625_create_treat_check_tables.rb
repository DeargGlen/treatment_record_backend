class CreateTreatCheckTables < ActiveRecord::Migration[6.1]
  def change
    create_table :treat_check_tables do |t|
      t.references :treatment, foreign_key: true, null:false
      t.integer :stool, default: 0
      t.integer :feed, default: 0
      t.integer :cough, default: 0
      t.integer :nose, default: 0
      t.integer :condition, default: 0

      t.timestamps
    end
  end
end
