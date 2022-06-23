class CreateMedicineEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :medicine_entries do |t|
      t.references :treatment, foreign_key: true, null:false
      t.references :medicine_tag, foreign_key: true, null:false
      t.float :amount, null:false
      t.integer :amount_type, default: 0


      t.timestamps
    end
  end
end
