class CreateFonts < ActiveRecord::Migration[6.0]
  def change
    create_table :fonts do |t|
      t.string :heading
      t.string :paragraph

      t.timestamps
    end
  end
end
