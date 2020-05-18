class CreatePlaceholders < ActiveRecord::Migration[6.0]
  def change
    create_table :placeholders do |t|
      t.string :name
      t.text :value

      t.timestamps
    end
  end
end
