class CreateTreatments < ActiveRecord::Migration[6.1]
  def change
    create_table :treatments do |t|
      t.references :individual, foreign_key: true, null:false, type: :string
      t.datetime :datetime
      t.float :body_temperature
      t.text :symptom
      t.text :content
      t.boolean :gotDosage
      t.references :user, foreign_key: true, null:false
      
      t.timestamps
    end
  end
end