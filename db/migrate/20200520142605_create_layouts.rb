class CreateLayouts < ActiveRecord::Migration[6.0]
  def change
    create_table :layouts do |t|
      t.string :name
      t.text :html

      t.timestamps
    end
  end
end
