class CreateIndividualTagEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :individual_tag_entries do |t|
      t.references :individual, foreign_key: true, null:false, type: :string
      t.references :individual_tag, foreign_key: true, null:false

      t.timestamps
    end
  end
end
