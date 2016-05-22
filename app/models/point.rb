class Point < ActiveRecord::Base
  has_many :categories, through: :markers
  has_many :markers

  def to_s
    title
  end
end
