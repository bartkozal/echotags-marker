class Category < ActiveRecord::Base
  has_many :points, through: :marker
end
