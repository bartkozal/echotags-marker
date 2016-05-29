class CreateTriggers < ActiveRecord::Migration
  def change
    create_table :triggers do |t|
      t.float :latitude
      t.float :longitude
      t.references :point, index: true, foreign_key: true
    end
  end
end
