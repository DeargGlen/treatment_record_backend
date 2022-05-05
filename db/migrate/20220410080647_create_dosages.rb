class CreateDosages < ActiveRecord::Migration[6.1]
  def change
    create_table :dosages do |t|
      t.references :treatment, foreign_key: true, null:false
      t.references :medicine, foreign_key: true, null:false
      t.float :amount, null:false
      
      t.timestamps
    end
  end
end
