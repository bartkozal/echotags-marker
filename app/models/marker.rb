class Marker < ActiveRecord::Base
  belongs_to :point
  belongs_to :category

  def as_json(*)
    {category: category.name, point: point.title}
  end
end
