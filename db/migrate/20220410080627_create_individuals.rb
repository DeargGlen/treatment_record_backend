class CreateIndividuals < ActiveRecord::Migration[6.1]
  def change
    create_table :individuals, id: false do |t|
      t.string :id, primary_key: true
      t.date :date_of_birth
      t.integer :sex, default: 0
      t.integer :category, default: 0
      t.integer :breed_type, default: 0
      t.string :mother_id
      t.string :father_name
      t.string :grandfather_name
      t.date :date_of_introduction
      t.references :block, foreign_key: true, null:false
      t.timestamps
    end
  end
end