class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.string :title
      t.float :latitude
      t.float :longitude
      t.string :recording_path

      t.timestamps null: false
    end
  end
end
