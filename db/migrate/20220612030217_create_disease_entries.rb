class CreateDiseaseEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :disease_entries do |t|
      t.references :treatment, foreign_key: true, null:false
      t.references :disease_tag, foreign_key: true, null:false

      t.timestamps
    end
  end
end
