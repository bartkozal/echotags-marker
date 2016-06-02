class RemoveVisibleFromCategories < ActiveRecord::Migration
  def change
    remove_column(:categories, :visible)
  end
end
