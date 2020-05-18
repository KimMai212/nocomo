class AddLayoutToProject < ActiveRecord::Migration[6.0]
  def change
    add_reference :projects, :layout, null: false, foreign_key: true
  end
end
