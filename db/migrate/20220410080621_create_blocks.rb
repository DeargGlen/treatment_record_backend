class CreateBlocks < ActiveRecord::Migration[6.1]
  def change
    create_table :blocks do |t|
      t.string :No
      t.references :barn, foreign_key: true, null:false
      t.integer :capacity

      t.timestamps
    end
  end
end
