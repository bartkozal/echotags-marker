class AddTimestampsToTriggers < ActiveRecord::Migration
  def change
    add_timestamps(:triggers)
  end
end
