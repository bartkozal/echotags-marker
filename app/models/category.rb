class Category < ActiveRecord::Base
  has_many :points, through: :markers
  has_many :markers

  validates_presence_of :name

  acts_as_list top_of_list: 0

  def to_s
    name
  end

  def as_json(*)
    {name: name}
  end
end
