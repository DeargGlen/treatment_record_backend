class CreateTreatComments < ActiveRecord::Migration[6.1]
  def change
    create_table :treat_comments do |t|
      t.references :treatment, foreign_key: true, null:false
      t.text :content
      t.references :user, foreign_key: true, null:false
      
      t.timestamps
    end
  end
end
