class CreateTransferEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :transfer_entries do |t|
      t.references :transfer, foreign_key: true, null:false
      t.references :individual, foreign_key: true, null:false, type: :string
      t.integer :prev_block_id
      t.integer :after_block_id

      t.timestamps
    end
    add_index :transfer_entries, :prev_block_id
    add_index :transfer_entries, :after_block_id
  end
end
