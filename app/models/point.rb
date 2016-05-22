class Point < ActiveRecord::Base
  has_many :categories, through: :marker
end
