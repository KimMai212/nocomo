class CreateStyles < ActiveRecord::Migration[6.0]
  def change
    create_table :styles do |t|
      t.string :name
      t.string :css
      t.integer :order

      t.timestamps
    end
  end
end
