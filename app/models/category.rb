class Category < ActiveRecord::Base
  has_many :points, through: :markers
  has_many :markers

  enum color: [:blue, :cyan, :green, :orange, :purple, :red, :yellow]

  validates_presence_of :name, :color

  acts_as_list top_of_list: 0

  def to_s
    name
  end

  def as_json(*)
    {name: name}
  end
end
