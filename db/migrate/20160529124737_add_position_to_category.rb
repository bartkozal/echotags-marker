class AddPositionToCategory < ActiveRecord::Migration
  def up
    add_column :categories, :position, :integer, default: 0
    Category.all.each_with_index { |category, i| category.set_list_position(i) }
  end

  def down
    remove_column :categories, :position
  end
end
