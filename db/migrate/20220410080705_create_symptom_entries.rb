class CreateSymptomEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :symptom_entries do |t|
      t.references :treatment, foreign_key: true, null:false
      t.references :symptom_tag, foreign_key: true, null:false
      
      t.timestamps
    end
  end
end
