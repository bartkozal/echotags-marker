class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.references :point, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
