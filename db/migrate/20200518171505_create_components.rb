class CreateComponents < ActiveRecord::Migration[6.0]
  def change
    create_table :components do |t|
      t.string :name
      t.string :kind
      t.string :html

      t.timestamps
    end
  end
end
