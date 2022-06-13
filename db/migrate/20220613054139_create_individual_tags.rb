class CreateIndividualTags < ActiveRecord::Migration[6.1]
  def change
    create_table :individual_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
