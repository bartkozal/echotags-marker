class Category < ActiveRecord::Base
  has_many :points, through: :markers
  has_many :markers

  def to_s
    title
  end
end
