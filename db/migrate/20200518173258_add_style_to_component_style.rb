class AddStyleToComponentStyle < ActiveRecord::Migration[6.0]
  def change
    add_reference :component_styles, :style, null: false, foreign_key: true
  end
end
