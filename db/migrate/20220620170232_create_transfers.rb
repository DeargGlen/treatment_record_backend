class CreateTransfers < ActiveRecord::Migration[6.1]
  def change
    create_table :transfers do |t|
      t.date :date
      t.boolean :completed, default: 0

      t.timestamps
    end
  end
end
