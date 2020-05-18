class CreateComponentStyles < ActiveRecord::Migration[6.0]
  def change
    create_table :component_styles do |t|

      t.timestamps
    end
  end
end
