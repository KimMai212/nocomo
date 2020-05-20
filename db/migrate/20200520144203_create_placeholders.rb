class CreatePlaceholders < ActiveRecord::Migration[6.0]
  def change
    create_table :placeholders do |t|
      t.string :name
      t.string :value
      t.references  :project, foreign_key: true
      t.timestamps
    end
  end
end
