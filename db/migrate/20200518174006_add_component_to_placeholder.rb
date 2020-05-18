class AddComponentToPlaceholder < ActiveRecord::Migration[6.0]
  def change
    add_reference :placeholders, :component, null: false, foreign_key: true
  end
end
