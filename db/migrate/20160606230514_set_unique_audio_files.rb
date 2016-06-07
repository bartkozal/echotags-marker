class SetUniqueAudioFiles < ActiveRecord::Migration
  def up
    Point.all.each do |point|
      point.update_attribute(:audio, point.title.parameterize)
    end
  end

  def down
    Point.all.each do |point|
      point.update_attribute(:audio, "sample")
    end
  end
end
