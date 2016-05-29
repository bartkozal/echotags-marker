class Point < ActiveRecord::Base
  has_many :categories, through: :markers
  has_many :markers

  validates_presence_of :title, :categories, :latitude, :longitude

  def self.duplicates
    Point.group(:title).count.select { |_, count| count > 1 }.keys
  end

  def first_category_title
    categories.first&.title
  end

  def to_s
    title
  end

  def as_json(options)
    {title: title, latitude: latitude, longitude: longitude}
  end
end
