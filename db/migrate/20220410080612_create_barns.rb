class CreateBarns < ActiveRecord::Migration[6.1]
  def change
    create_table :barns do |t|
      t.string :name
      t.references :area, foreign_key: true, null:false
      
      t.timestamps
    end
  end
end
