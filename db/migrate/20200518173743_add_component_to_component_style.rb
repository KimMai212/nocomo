class AddComponentToComponentStyle < ActiveRecord::Migration[6.0]
  def change
    add_reference :component_styles, :component, null: false, foreign_key: true
  end
end
