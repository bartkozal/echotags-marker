class Category < ActiveRecord::Base
  has_many :points, through: :markers
  has_many :markers

  validates_presence_of :title

  acts_as_list top_of_list: 0

  def to_s
    title
  end

  def as_json(options)
    {title: title}
  end
end
