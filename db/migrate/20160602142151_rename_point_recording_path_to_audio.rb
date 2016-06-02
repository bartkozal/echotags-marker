class RenamePointRecordingPathToAudio < ActiveRecord::Migration
  def up
    rename_column :points, :recording_path, :audio

    Point.all.each do |point|
      point.update_attribute(:audio, "sample")
    end
  end

  def down
    rename_column :points, :audio, :recording_path

    Point.all.each do |point|
      point.update_attribute(:recording_path, nil)
    end
  end
end
