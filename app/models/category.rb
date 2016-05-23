class Category < ActiveRecord::Base
  has_many :points, through: :markers
  has_many :markers

  validates_presence_of :title

  def to_s
    title
  end
end
