class AddColorToCategories < ActiveRecord::Migration
  def up
    add_column :categories, :color, :integer, default: 0
    Category.all.each { |category| category.update_attribute(:color, :red) }
  end

  def down
    remove_column :categories, :color
  end
end
