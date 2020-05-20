class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.references  :layout, foreign_key: true
      t.references  :color, foreign_key: true
      t.references  :design, foreign_key: true
      t.references  :user, foreign_key: true
      t.references  :font, foreign_key: true
      t.timestamps
    end
  end
end
